// Table Chapters

import 'package:drift/drift.dart';
import 'package:study_ready/data/local/db/entity/subject_entity.dart';


class Chapters extends Table {

  IntColumn get id => integer().autoIncrement().named('id')();

  IntColumn get subjectId => integer().references(Subjects, #id).named('subjectId')();

  TextColumn get name => text().named('chapter_name')();

}