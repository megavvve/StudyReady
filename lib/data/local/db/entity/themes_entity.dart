// Table Themes

import 'package:drift/drift.dart';
import 'package:study_ready/data/local/db/entity/subject_entity.dart';

import 'chapter_entity.dart';


class Themes extends Table {

  IntColumn get id => integer().autoIncrement().named('id')();

  IntColumn get subjectId => integer().references(Subjects, #id).named('subjectId')();

  IntColumn get chapterId => integer().references(Chapters, #id).named('chapterId')();

  TextColumn get name => text().named('theme_name')();

}