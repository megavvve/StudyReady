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
    fillQuestions(trainer);
    fillTrainer(trainer);
  }

  // Json decode
  Future<List> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('assets/jsons/trainers.json');
    final data = jsonDecode(jsonString);
    final trainer = data['trainers'];
    return trainer;
  }

  Future<void> fillQuestions(trainer) async {
    var listOfQuestions = await db.getQuestionsFullInfo();
     if (listOfQuestions.isEmpty) {
       final questions = trainer[0]['questions'];
       for (int i = 0; i < questions.length; i ++) {
         final incorrectAns = (questions[i]['incorrectAnswers'] as List).map((
             e) => e as String).toList();
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

     // Debug print

     //var listOfQuestionsDebug = await db.getQuestionsFullInfo();
     // for (var i = 0; i < listOfQuestionsDebug.length; i++) {
     //   print((listOfQuestionsDebug[i].id, listOfQuestionsDebug[i].course,
     //   listOfQuestionsDebug[i].subject, listOfQuestionsDebug[i].chapter, listOfQuestionsDebug[i].theme,
     //   listOfQuestionsDebug[i].difficultly, listOfQuestionsDebug[i].context, listOfQuestionsDebug[i].rightAnswer, listOfQuestionsDebug[i].incorrectAnswers));
     // }

  }

  Future<void> fillTrainer(trainer) async {
    var listOfTrainers = await db.getTrainers();
    if (listOfTrainers.isEmpty) {
      final questions = trainer[0]['questions'];
      List<String> questionsIds = [];
      for (int i = 0; i < questions.length; i ++) {
        questionsIds.add((questions[i]['id']).toString());
      }
      questionsIds = (questionsIds).map((e) => e as String).toList();
      var trainerDB = TrainersCompanion(name: drift.Value(trainer[0]['name']),
          color: drift.Value(trainer[0]['color']),
          image: drift.Value(trainer[0]['image']),
          questions: drift.Value(questionsIds));

      db.insertTrainer(trainerDB);
    }

    var listOfTrainersDebug = await db.getTrainers();

    print(listOfTrainersDebug);

    var questionsInTrainer1 = listOfTrainersDebug[0];

    var trainerComplete = await db.getTrainerFullInfoById(questionsInTrainer1.id);

    var trainerCompleteQuestions = [];

    for (int i = 0; i < trainerComplete.questions.length; i ++) {
      trainerCompleteQuestions.add((trainerComplete.questions[i].id, trainerComplete.questions[i].course,
      trainerComplete.questions[i].subject, trainerComplete.questions[i].chapter, trainerComplete.questions[i].theme,
      trainerComplete.questions[i].difficultly, trainerComplete.questions[i].context, trainerComplete.questions[i].rightAnswer, trainerComplete.questions[i].incorrectAnswers));
    }

    print([trainerComplete.id, trainerComplete.name, trainerComplete.color, trainerComplete.image, trainerCompleteQuestions]);


    }

  // creating test subjects

  void fillSubjects() async {
    var listOfSubjects = await db.getSubjects();
    if (listOfSubjects.isEmpty) {
      var subjects = [
        'Непрерывная математика'];

      for (int i = 0; i < subjects.length; i++) {
        var subject = SubjectsCompanion(name: drift.Value(subjects[i]));

        db.insertSubject(subject);
      }
    }

    var listOfSubjectsDebug = await db.getSubjects();
    print(listOfSubjectsDebug);
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

    var listOfChaptersDebug = await db.getChapters();
    print(listOfChaptersDebug);
  }

  // creating test themes

  void fillThemes() async {
    var listOfThemes = await db.getThemes();
    if (listOfThemes.isEmpty) {
      var subjectIds = [1];
      var chapterNames = [1];
      var names = [
        'Основные обозначения'];

      for (int i = 0; i < subjectIds.length; i++) {
        var theme = ThemesCompanion(
            subjectId: drift.Value(subjectIds[i]),
            chapterId: drift.Value(chapterNames[i]),
            name: drift.Value(names[i]));

        db.insertTheme(theme);
      }
    }

    var listOfThemesDebug = await db.getThemes();
    print(listOfThemesDebug);
  }


}
