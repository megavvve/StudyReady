import 'package:study_ready/domain/entities/subject.dart';

class MMaterial {
  final int id;

  final String name;

  final Subject subject;

  final String context;

  MMaterial(
      {required this.id,
      required this.name,
      required this.subject,
      required this.context});
}
