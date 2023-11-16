// Table Question

import 'package:drift/drift.dart';
import 'package:study_ready/data/local/db/entity/subject_entity.dart';
import 'package:study_ready/data/local/db/entity/themes_entity.dart';
import 'chapter_entity.dart';
import 'strings_list_json_converter.dart';


class Question extends Table {

  IntColumn get id => integer().autoIncrement()();

  IntColumn get courseNumber => integer().named('course_number')();

  IntColumn get subjectId => integer().named('course_id').references(Subjects, #id)();

  IntColumn get chapterId => integer().named('chapter_id').references(Chapters, #id)();

  IntColumn get themeId => integer().named('theme_id').references(Themes, #id)();

  TextColumn get difficultly => text().named('difficultly')();

  TextColumn get questionContext => text().named('question_context')();

  TextColumn get rightAnswer => text().named('right_answer')();

  TextColumn get incorrectAnswers => text().map(StringListTypeConverter()).named('incorrect_answers')();

}