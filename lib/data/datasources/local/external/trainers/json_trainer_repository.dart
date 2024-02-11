import 'dart:convert';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import '../../app_db.dart';

class JsonTrainerRepository {
   final AppDB _db = GetIt.instance.get<AppDB>();

  Future<void> initializeTrainers() async {
    // functions for filling tables with default data

    // (!) for full database clean re-install app
    _fillSubjects();
    _fillChapters();
    _fillThemes();
    var trainers = await _loadJsonAsset();
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
          var question = QuestionTableCompanion(
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
        var trainerDB = TrainerTableCompanion(
            subjectName: drift.Value(trainer[j][0]['subjectName']),
            trainerName: drift.Value(trainer[j][0]['trainerName']),
            description: drift.Value(trainer[j][0]['description']),
            color: drift.Value(trainer[j][0]['color']),
            image: drift.Value(trainer[j][0]['image']),
            questions: drift.Value(questionsIds));

        _db.insertTrainer(trainerDB);
      }
    }

    var listOfTrainersDebug = await _db.getTrainers();

    var questionsInTrainers = listOfTrainersDebug;
    if (questionsInTrainers.isNotEmpty) {
      for (int i = 0; i < questionsInTrainers.length; i++) {
        var trainerComplete =
            await _db.getTrainerFullInfoById(questionsInTrainers[i].id);

        var trainerCompleteQuestions = [];

        for (int j = 0; j < trainerComplete.questions.length; j++) {
          trainerCompleteQuestions.add(
            (
              trainerComplete.questions[j].id,
              trainerComplete.questions[j].course,
              trainerComplete.questions[j].subject,
              trainerComplete.questions[j].chapter,
              trainerComplete.questions[j].theme,
              trainerComplete.questions[j].difficultly,
              trainerComplete.questions[j].context,
              trainerComplete.questions[j].rightAnswer,
              trainerComplete.questions[j].incorrectAnswers,
            ),
          );
        }
      }
    }
  }

  // creating test subjects

  Future<void> _fillSubjects() async {
    List<SubjectTableData> listOfSubjects = await _db.getSubjects();
    if (listOfSubjects.isEmpty) {
      List<String> subjects = ['Непрерывная математика'];

      for (int i = 0; i < subjects.length; i++) {
        SubjectTableCompanion subject = SubjectTableCompanion(
          name: drift.Value(
            subjects[i],
          ),
        );

        _db.insertSubject(subject);
      }
    }
  }

  // creating test chapters

  Future<void> _fillChapters() async {
    List<ChapterTableData> listOfChapters = await _db.getChapters();
    if (listOfChapters.isEmpty) {
      List<int> chaptersIds = [1];
      List<String> chaptersNames = ['Нулевая глава'];

      for (int i = 0; i < chaptersIds.length; i++) {
        ChapterTableCompanion chapter = ChapterTableCompanion(
          subjectId: drift.Value(
            chaptersIds[i],
          ),
          name: drift.Value(
            chaptersNames[i],
          ),
        );

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
        var theme = ThemeTableCompanion(
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
