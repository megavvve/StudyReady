
// the class contains converter from List<String> to json and json to List<String>

import 'dart:convert';
import 'package:drift/drift.dart';

class StringListTypeConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> fromSql(String fromDb) {
    return List<String>.from(json.decode(fromDb));
  }

  @override
  String toSql(List<String> value) {
    return json.encode(value);
  }
}