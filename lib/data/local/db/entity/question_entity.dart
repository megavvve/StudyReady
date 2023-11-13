// Table Question

import 'package:drift/drift.dart';
import 'incorrect_answers.dart';


class Question extends Table {

  IntColumn get id => integer().autoIncrement()();

  IntColumn get courseNumber => integer().named('course_number')();

  IntColumn get subjectId => integer().named('course_id')();

  IntColumn get chapterId => integer().named('chapter_id')();

  IntColumn get themeId => integer().named('theme_id')();

  TextColumn get difficultly => text().named('difficultly')();

  TextColumn get questionContext => text().named('question_context')();

  TextColumn get rightAnswer => text().named('right_answer')();

  TextColumn get incorrectAnswers => text().map(StringListTypeConverter()).named('incorrect_answers')();

}