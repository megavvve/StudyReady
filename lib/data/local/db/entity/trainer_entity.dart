// Table Trainers

import 'package:drift/drift.dart';
import 'strings_list_json_converter.dart';



class Trainers extends Table {

  IntColumn get id => integer().autoIncrement().named('id')();

  TextColumn get name => text().named('name')();

  TextColumn get color => text().named('color')(); // here will be code of color ex. #FFFFFF

  TextColumn get image => text().named('image_link')(); // here will be link to and image stored locally or server

  TextColumn get questions => text().map(StringListTypeConverter()).named('questions_ids')(); // list of ids of questions


}