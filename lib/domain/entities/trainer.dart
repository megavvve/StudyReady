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
  static Trainer? getTrainerFromMyText(String? text, List<Trainer> trainers) {
    if (text != null && trainers.isNotEmpty) {
      List<String> parts = text.split(", ");
      String trainerName = parts[0].split(": ")[1];
      String subjectName = parts[1].split(": ")[1];
      return trainers.firstWhere(
        (trainer) =>
            trainer.trainerName == trainerName &&
            trainer.subjectName == subjectName,
      );
    } else {
      return null;
    }
  }

  static int getNextTrainerId(List<Trainer> trainers) {
    if (trainers.isEmpty) {
      return 1; // Если список пуст, начинаем с id = 1
    } else {
      return trainers
              .map((trainer) => trainer.id)
              .reduce((a, b) => a > b ? a : b) +
          1;
    }
  }
}
