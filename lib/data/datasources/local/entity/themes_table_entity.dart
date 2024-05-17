// Table Themes




import 'package:drift/drift.dart';
import 'package:study_ready/data/datasources/local/entity/chapter_table_entity.dart';
import 'package:study_ready/data/datasources/local/entity/subject_table_entity.dart';
class ThemeTable extends Table {

  IntColumn get id => integer().autoIncrement().named('id')();

  IntColumn get subjectId => integer().references(SubjectTable, #id).named('subjectId')();

  IntColumn get chapterId => integer().references(ChapterTable, #id).named('chapterId')();

  TextColumn get name => text().named('theme_name')();

}