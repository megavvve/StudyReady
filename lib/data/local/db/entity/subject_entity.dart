// Table Subjects

import 'package:drift/drift.dart';


class Subjects extends Table {

  IntColumn get id => integer().autoIncrement().named('id')();

  TextColumn get name => text().named('subject_name')();

}