import 'package:study_ready/domain/entities/question.dart';

class Trainer {
  int id;

  String trainerName;
  String subjectName;

  String description;
  String? color;

  String? image;

  final List<Question> questions;

  Trainer({
    required this.id,
    required this.trainerName,
    required this.subjectName,
    required this.description,
    required this.color,
    required this.image,
    required this.questions,
  });
}
