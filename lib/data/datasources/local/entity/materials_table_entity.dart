// Table Materials

import 'package:drift/drift.dart';
import 'package:study_ready/data/datasources/local/entity/subject_table_entity.dart';

class MaterialsTable extends Table {

  IntColumn get id => integer().autoIncrement().named('id')();

  TextColumn get name => text().named('name')();

  IntColumn get subjectId => integer().references(SubjectTable, #id).named('subjectId')();

  TextColumn get context => text().named('context')();

}