// Database methods class

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:study_ready/domain/models/trainer.dart' as tr;
import 'package:study_ready/data/local/db/entity/chapter_entity.dart';
import 'package:study_ready/data/local/db/entity/question_entity.dart';
import 'package:study_ready/data/local/db/entity/subject_entity.dart';
import 'package:study_ready/data/local/db/entity/themes_entity.dart';
import 'package:study_ready/data/local/db/entity/trainer_entity.dart';
import 'entity/strings_list_json_converter.dart';
part 'app_db.g.dart';

LazyDatabase _openConnection(){
  return LazyDatabase(() async {

    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'learning.sqlite'));

    return NativeDatabase(file);
  });
}


// Themes object with joined subject and chapter
class ThemesComplete {
  final int id;
  final String subject;
  final String chapter;
  final String name;

  ThemesComplete({required this.id, required this.subject, required this.chapter, required this.name});
}

class QuestionsComplete {
  final int id;
  final int course;
  final String subject;
  final String chapter;
  final String theme;
  final String difficultly;
  final String context;
  final String rightAnswer;
  final List<String> incorrectAnswers;

  QuestionsComplete({required this.id, required this.course, required this.subject, required this.chapter,
    required this.theme, required this.difficultly, required this.context, required this.rightAnswer,
      required this.incorrectAnswers});
}

class TrainersComplete {
  final int id;
  final String name;
  final String? color;
  final String? image;
  final List<QuestionsComplete> questions;

  TrainersComplete({required this.id, required this.name, required this.color, required this.image,
    required this.questions});
}

@DriftDatabase(tables: [Subjects, Chapters, Themes, Question, Trainers])
class AppDB extends _$AppDB {

  AppDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Methods for Subjects

  // Get list of questions
  Future<List<Subject>> getSubjects() async {
    return await select(subjects).get();
  }

  // Add new Question
  Future<int> insertSubject(SubjectsCompanion entity) async {
    return await into(subjects).insert(entity);
  }

  // Delete Subject by id
  Future<int> deleteSubject(int id) async {
    return await (delete(subjects)
      ..where((tbl) => tbl.id.equals(id))).go();
  }


  // Methods for Chapters

  // Get list of chapters
  Future<List<Chapter>> getChapters() async {
    return await select(chapters).get();
  }

  // Add new Chapter
  Future<int> insertChapter(ChaptersCompanion entity) async {
    return await into(chapters).insert(entity);
  }

  // Delete Chapter by id
  Future<int> deleteChapter(int id) async {
    return await (delete(chapters)
      ..where((tbl) => tbl.id.equals(id))).go();
  }


  // Methods for Themes

  // Get list of themes
  Future<List<Theme>> getThemes() async {
    return await select(themes).get();
  }

  // Add new Theme
  Future<int> insertTheme(ThemesCompanion entity) async {
    return await into(themes).insert(entity);
  }

  // Delete Theme by id
  Future<int> deleteTheme(int id) async {
    return await (delete(themes)
      ..where((tbl) => tbl.id.equals(id))).go();
  }


  // Whole info about theme
  Future<List<ThemesComplete>> themeFullInfo() async {
    // create aliases for the geoPoints table so that we can reference it twice
    final subject = alias(subjects, 's');
    final chapter = alias(chapters, 'c');

    final rows = await select(themes).join([
      innerJoin(subject, subject.id.equalsExp(themes.subjectId)),
      innerJoin(chapter, chapter.id.equalsExp(themes.chapterId)),
    ]).get();

    return rows.map((resultRow) {
      return ThemesComplete(
        id: resultRow.readTable(themes).id,
        subject: resultRow.readTable(subject).name,
        chapter: resultRow.readTable(chapter).name,
        name: resultRow.readTable(themes).name,
      );
    }).toList();
  }


  // Methods for Questions table


  // Get question fill info join subjects, chapters, themes
  Future<List<QuestionsComplete>> getQuestionsFullInfo() async {
    final subject = alias(subjects, 's');
    final chapter = alias(chapters, 'c');
    final theme = alias(themes, 't');

    final rows = await select(question).join([
      innerJoin(subject, subject.id.equalsExp(question.subjectId)),
      innerJoin(chapter, chapter.id.equalsExp(question.chapterId)),
      innerJoin(theme, theme.id.equalsExp(question.themeId)),
    ]).get();

    return rows.map((resultRow) {
      return QuestionsComplete(
        id: resultRow.readTable(question).id,
        course: resultRow.readTable(question).courseNumber,
        subject: resultRow.readTable(subject).name,
        chapter: resultRow.readTable(chapter).name,
        theme: resultRow.readTable(theme).name,
        difficultly: resultRow.readTable(question).difficultly,
        context: resultRow.readTable(question).questionContext,
        rightAnswer: resultRow.readTable(question).rightAnswer,
        incorrectAnswers: resultRow.readTable(question).incorrectAnswers
      );
    }).toList();

  }

  Future<QuestionsComplete> getQuestionFullInfoById(int id) async {
    final subject = alias(subjects, 's');
    final chapter = alias(chapters, 'c');
    final theme = alias(themes, 't');

    final query = select(question).join([
      innerJoin(subject, subject.id.equalsExp(question.subjectId)),
      innerJoin(chapter, chapter.id.equalsExp(question.chapterId)),
      innerJoin(theme, theme.id.equalsExp(question.themeId)),
    ]);

    query.where(question.id.equals(id));

    return query.watchSingle().map((resultRow) {
      return QuestionsComplete(
          id: resultRow.readTable(question).id,
          course: resultRow.readTable(question).courseNumber,
          subject: resultRow.readTable(subject).name,
          chapter: resultRow.readTable(chapter).name,
          theme: resultRow.readTable(theme).name,
          difficultly: resultRow.readTable(question).difficultly,
          context: resultRow.readTable(question).questionContext,
          rightAnswer: resultRow.readTable(question).rightAnswer,
          incorrectAnswers: resultRow.readTable(question).incorrectAnswers
      );
    }).first;
  }



  // Get question by id
  Future<QuestionData> getQuestion(int id) async {
    return await (select(question)
      ..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  // Update question with new entity
  Future<bool> updateQuestion(QuestionCompanion entity) async {
    return await update(question).replace(entity);
  }

  // Add new Question
  Future<int> insertQuestion(QuestionCompanion entity) async {
    return await into(question).insert(entity);
  }

  // Delete Question by id
  Future<int> deleteQuestion(int id) async {
    return await (delete(question)
      ..where((tbl) => tbl.id.equals(id))).go();
  }

  // Trainers

  // Add new Trainer
  Future<int> insertTrainer(TrainersCompanion entity) async {
    return await into(trainers).insert(entity);
  }

  // Get Trainer by id
  Future<Trainer> getTrainer(int id) async {
    return await (select(trainers)
      ..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  // Get full Trainer info (questions with ids)
  Future<List<Trainer>> getTrainers() async {
    return await select(trainers).get();
  }

  // Get full TrainersComplete objects
  Future<TrainersComplete> getTrainerFullInfoById(int id) async {

    var trainerBase = await getTrainer(id);
    var questions = trainerBase.questions;
    List<QuestionsComplete> questionsFull = [];
    for (int i = 0; i < questions.length; i++) {
      var q = await getQuestionFullInfoById(int.parse(questions[i]));
      questionsFull.add(q);
    }
    return TrainersComplete(id: trainerBase.id, name: trainerBase.name, color: trainerBase.color, image: trainerBase.image, questions: questionsFull);
  }

}