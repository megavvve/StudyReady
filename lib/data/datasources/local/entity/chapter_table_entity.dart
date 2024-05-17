// Table Chapters

import 'package:drift/drift.dart';
import 'package:study_ready/data/datasources/local/entity/subject_table_entity.dart';

class ChapterTable extends Table {

  IntColumn get id => integer().autoIncrement().named('id')();

  IntColumn get subjectId => integer().references(SubjectTable, #id).named('subjectId')();

  TextColumn get name => text().named('chapter_name')();

}