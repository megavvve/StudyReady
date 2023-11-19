// Database methods class

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
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


@DriftDatabase(tables: [Subjects, Chapters, Themes, Question, Trainers])
class AppDB extends _$AppDB {

  AppDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Methods for Questions table


  // Get list of questions
  Future<List<QuestionData>> getQuestions() async {
    return await select(question).get();
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


  // Whole info about theme (in dev)
  // Future<Stream<List<dynamic>>> themeFullInfo() async {
    // final query = select(themes).join([
    //   // In joins, `useColumns: false` tells drift to not add columns of the
    //   // joined table to the result set. This is useful here, since we only join
    //   // the tables so that we can refer to them in the where clause.
    //   leftOuterJoin(subjects, subjects.id.equalsExp(themes.subjectId),
    //       useColumns: false),
    //   leftOuterJoin(chapters, chapters.id.equalsExp(themes.chapterId),
    //       useColumns: false)
    // ]);
    // return query.map((row) => row.readTable(themes)).get();
  //   const query = "SELECT Themes.id, Subjects.subject_name, Chapters.chapter_name, Themes.theme_name from Themes inner join Subjects on Themes.subjectId = Subjects.id inner join Chapters on Themes.chapterId = Chapters.id";
  //   return customSelect(query, readsFrom: {themes, subjects, chapters},).watch().map((rows) {
  //     return rows
  //         .map((row) => Theme(
  //       category: categories.map(row.data),
  //       count: row.read<int>('amount'),
  //     ))
  //         .toList();
  //   });
  //
  //
  // }
}