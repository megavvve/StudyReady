// Table Themes

import 'package:drift/drift.dart';
import 'package:study_ready/data/local/db/entity/subject_entity.dart';

import 'chapter_entity.dart';


class Themes extends Table {

  IntColumn get id => integer().autoIncrement()();

  IntColumn get subjectId => integer().references(Subjects, #id)();

  IntColumn get chapterId => integer().references(Chapters, #id)();

  TextColumn get name => text().named('theme_name')();

}