// Table Question

import 'package:drift/drift.dart';
import 'package:study_ready/data/datasources/local/entity/subject_table_entity.dart';
import 'package:study_ready/data/datasources/local/entity/themes_table_entity.dart';
import 'chapter_table_entity.dart';
import 'strings_list_json_converter.dart';

class QuestionTable extends Table {

  IntColumn get id => integer().autoIncrement().named('id')();

  IntColumn get courseNumber => integer().named('course_number')();

  IntColumn get subjectId => integer().named('course_id').references(SubjectTable, #id)();

  IntColumn get chapterId => integer().named('chapter_id').references(ChapterTable, #id)();

  IntColumn get themeId => integer().named('theme_id').references(ThemeTable, #id)();

  TextColumn get difficultly => text().named('difficultly')();

  TextColumn get questionContext => text().named('question_context')();

  TextColumn get rightAnswer => text().named('right_answer')();

  TextColumn get incorrectAnswers => text().map(StringListTypeConverter()).named('incorrect_answers')();

}