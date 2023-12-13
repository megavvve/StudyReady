import 'dart:convert';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/services.dart';
import '../../../data/local/db/app_db.dart';

class FillTables {
  AppDB db = AppDB();

  void firstAppLaunch() async {
    // functions for filling tables with default data

    // (!) for full database clean re-install app
    fillSubjects();
    fillChapters();
    fillThemes();
    var trainer = await loadJsonAsset();
    // print(trainer);
    // print(trainer[0]);
    // print(trainer[1]);
    fillQuestions(trainer);
    fillTrainer(trainer);
  }

  // Json decode
  Future<List> loadJsonAsset() async {
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

  Future<void> fillQuestions(trainer) async {
    var listOfQuestions = await db.getQuestionsFullInfo();
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

          db.insertQuestion(question);
        }
      }
    }

    // Debug print

    // var listOfQuestionsDebug = await db.getQuestionsFullInfo();
    // for (var i = 0; i < listOfQuestionsDebug.length; i++) {
    //   print((listOfQuestionsDebug[i].id, listOfQuestionsDebug[i].course,
    //   listOfQuestionsDebug[i].subject, listOfQuestionsDebug[i].chapter, listOfQuestionsDebug[i].theme,
    //   listOfQuestionsDebug[i].difficultly, listOfQuestionsDebug[i].context, listOfQuestionsDebug[i].rightAnswer, listOfQuestionsDebug[i].incorrectAnswers));
    // }
  }

  Future<void> fillTrainer(trainer) async {
    var listOfTrainers = await db.getTrainers();
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

        db.insertTrainer(trainerDB);
      }
    }

    var listOfTrainersDebug = await db.getTrainers();
    //print(listOfTrainersDebug);

    var questionsInTrainers = listOfTrainersDebug;
    if (questionsInTrainers.isNotEmpty) {
      for (int i = 0; i < questionsInTrainers.length; i++) {
        var trainerComplete =
            await db.getTrainerFullInfoById(questionsInTrainers[i].id);

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

      // print([
      //   trainerComplete.id,
      //   trainerComplete.name,
      //   trainerComplete.color,
      //   trainerComplete.image,
      //   trainerCompleteQuestions
      // ]);
    }
  }

  // creating test subjects

  void fillSubjects() async {
    var listOfSubjects = await db.getSubjects();
    if (listOfSubjects.isEmpty) {
      var subjects = ['Непрерывная математика'];

      for (int i = 0; i < subjects.length; i++) {
        var subject = SubjectsCompanion(name: drift.Value(subjects[i]));

        db.insertSubject(subject);
      }
    }

    // var listOfSubjectsDebug = await db.getSubjects();
    // print(listOfSubjectsDebug);
  }

  // creating test chapters

  void fillChapters() async {
    var listOfChapters = await db.getChapters();
    if (listOfChapters.isEmpty) {
      var chaptersIds = [1];
      var chaptersNames = ['Нулевая глава'];

      for (int i = 0; i < chaptersIds.length; i++) {
        var chapter = ChaptersCompanion(
            subjectId: drift.Value(chaptersIds[i]),
            name: drift.Value(chaptersNames[i]));

        db.insertChapter(chapter);
      }
    }

    // var listOfChaptersDebug = await db.getChapters();
    // print(listOfChaptersDebug);
  }

  // creating test themes

  void fillThemes() async {
    var listOfThemes = await db.getThemes();
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

        db.insertTheme(theme);
      }
    }

    // var listOfThemesDebug = await db.getThemes();
    // print(listOfThemesDebug);
  }
}
