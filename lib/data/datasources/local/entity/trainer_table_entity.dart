// Table Trainers
import 'package:drift/drift.dart';

import 'strings_list_json_converter.dart';


class TrainerTable extends Table {
  IntColumn get id => integer().autoIncrement().named('id')();

  TextColumn get trainerName => text().named('trainer_name')();

  TextColumn get subjectName => text().named('subject_name')();

  TextColumn get description => text().named('description')();

  TextColumn get color => text()
      .named('color')
      .nullable()(); // here will be code of color ex. #FFFFFF

  TextColumn get image => text()
      .named('image_link')
      .nullable()(); // here will be link to and image stored locally or server

  TextColumn get questions => text()
      .map(StringListTypeConverter())
      .named('questions_ids')(); // list of ids of questions
}
