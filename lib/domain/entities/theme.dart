import 'package:study_ready/domain/entities/chapter.dart';
import 'package:study_ready/domain/entities/subject.dart';

class Theme {
  final int id;
  final Subject subject;
  final Chapter chapter;
  final String name;

  Theme(
      {required this.id,
      required this.subject,
      required this.chapter,
      required this.name});
}
