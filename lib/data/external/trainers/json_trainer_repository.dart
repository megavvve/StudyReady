import 'dart:convert';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/services.dart';
import 'package:study_ready/domain/repository/trainer_repository.dart';
import '../../../data/local/db/app_db.dart';

class JsonTrainerRepository implements TrainerRepository {
final AppDB _db = AppDB();
  @override
  Future<void> initializeTrainers() async {
    // functions for filling tables with default data

    // (!) for full database clean re-install app
    _fillSubjects();
    _fillChapters();
    _fillThemes();
    var trainers = await _loadJsonAsset();
    // print(trainer);
    // print(trainer[0]);
    // print(trainer[1]);
    _fillQuestions(trainers);
    _fillTrainer(trainers);
  } // Json decode

  Future<List> _loadJsonAsset() async {
    final String jsonString1 =
        await rootBundle.loadString('assets/jsons/trainer1.json');

    final String jsonString2 =
        await rootBundle.loadString('assets/jsons/trainer2.json');

    final data1 = jsonDecode(jsonString1);
    final data2 = jsonDecode(jsonString2);

    final trainer1 = data1['trainers'];
    final trainer2 = data2['trainers'];

    return [trainer1, trainer2];
  }

  Future<void> _fillQuestions(trainer) async {
    var listOfQuestions = await _db.getQuestionsFullInfo();
    if (listOfQuestions.isEmpty) {
      for (int j = 0; j < trainer.length; j++) {
        final questions = trainer[j][0]['questions'];
        for (int i = 0; i < questions.length; i++) {
          final incorrectAns = (questions[i]['incorrectAnswers'] as List)
              .map((e) => e as String)
              .toList();
          var question = QuestionCompanion(
              courseNumber: drift.Value(questions[i]['courseNumber']),
              subjectId: drift.Value(questions[i]['subjectId']),
              chapterId: drift.Value(questions[i]['chapterId']),
              themeId: drift.Value(questions[i]['themeId']),
              difficultly: drift.Value(questions[i]['difficultly']),
              questionContext: drift.Value(questions[i]['questionContext']),
              rightAnswer: drift.Value(questions[i]['rightAnswer']),
              incorrectAnswers: drift.Value(incorrectAns));

          _db.insertQuestion(question);
        }
      }
    }

    
  }

  Future<void> _fillTrainer(trainer) async {
    var listOfTrainers = await _db.getTrainers();
    if (listOfTrainers.isEmpty) {
      for (int j = 0; j < trainer.length; j++) {
        final questions = trainer[j][0]['questions'];
        List<String> questionsIds = [];
        for (int i = 0; i < questions.length; i++) {
          questionsIds.add((questions[i]['id']).toString());
        }
        questionsIds = (questionsIds).map((e) => e).toList();
        var trainerDB = TrainersCompanion(
            name: drift.Value(trainer[j][0]['name']),
            color: drift.Value(trainer[j][0]['color']),
            image: drift.Value(trainer[j][0]['image']),
            questions: drift.Value(questionsIds));

        _db.insertTrainer(trainerDB);
      }
    }

    var listOfTrainersDebug = await _db.getTrainers();
    //print(listOfTrainersDebug);

    var questionsInTrainers = listOfTrainersDebug;
    if (questionsInTrainers.isNotEmpty) {
      for (int i = 0; i < questionsInTrainers.length; i++) {
        var trainerComplete =
            await _db.getTrainerFullInfoById(questionsInTrainers[i].id);

        var trainerCompleteQuestions = [];

        for (int j = 0; j < trainerComplete.questions.length; j++) {
          trainerCompleteQuestions.add((
            trainerComplete.questions[j].id,
            trainerComplete.questions[j].course,
            trainerComplete.questions[j].subject,
            trainerComplete.questions[j].chapter,
            trainerComplete.questions[j].theme,
            trainerComplete.questions[j].difficultly,
            trainerComplete.questions[j].context,
            trainerComplete.questions[j].rightAnswer,
            trainerComplete.questions[j].incorrectAnswers
          ));
        }
      }
    }
  }

  // creating test subjects

  Future<void> _fillSubjects() async {
    var listOfSubjects = await _db.getSubjects();
    if (listOfSubjects.isEmpty) {
      var subjects = ['Непрерывная математика'];

      for (int i = 0; i < subjects.length; i++) {
        var subject = SubjectsCompanion(name: drift.Value(subjects[i]));

        _db.insertSubject(subject);
      }
    }
  }

  // creating test chapters

  Future<void> _fillChapters() async {
    var listOfChapters = await _db.getChapters();
    if (listOfChapters.isEmpty) {
      var chaptersIds = [1];
      var chaptersNames = ['Нулевая глава'];

      for (int i = 0; i < chaptersIds.length; i++) {
        var chapter = ChaptersCompanion(
            subjectId: drift.Value(chaptersIds[i]),
            name: drift.Value(chaptersNames[i]));

        _db.insertChapter(chapter);
      }
    }
  }

  // creating test themes

  Future<void> _fillThemes() async {
    var listOfThemes = await _db.getThemes();
    if (listOfThemes.isEmpty) {
      var subjectIds = [1, 1];
      var chapterNames = [1, 1];
      var names = ['Основные обозначения', 'Абсолютная величина'];

      for (int i = 0; i < subjectIds.length; i++) {
        var theme = ThemesCompanion(
          subjectId: drift.Value(subjectIds[i]),
          chapterId: drift.Value(chapterNames[i]),
          name: drift.Value(
            names[i],
          ),
        );

        _db.insertTheme(theme);
      }
    }
  }
}

  
