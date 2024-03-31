// Table Materials

import 'package:drift/drift.dart';

class MaterialsTable extends Table {
  IntColumn get id => integer().autoIncrement().named('id')();

  TextColumn get fileName => text().named('fileName')();

  TextColumn get filePath => text().named('filePath')();

  TextColumn get uploadDate => text().named('uploadDate')();

  TextColumn get fileType => text().named('fileType')();
}
