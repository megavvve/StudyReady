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
  Future<QuestionData> getQuestion(int id) async{
    return await (select(question)..where((tbl) => tbl.id.equals(id))).getSingle();
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
    return await (delete(question)..where((tbl) => tbl.id.equals(id))).go();
  }

}