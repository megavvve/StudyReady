import 'package:study_ready/data/datasources/local/models/local_question_db.dart';

class LocalTrainer {
  final int id;
  final String trainerName;
  final String subjectName;
  final String description;
  final String? color;
  final String? image;
  final List<LocalQuestion> questions;

  LocalTrainer(
      {required this.id,
      required this.trainerName,
      required this.subjectName,
      required this.description,
      required this.color,
      required this.image,
      required this.questions});
}
