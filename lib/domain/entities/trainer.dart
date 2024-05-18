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
    final existingIds = trainers.map((material) => material.id);
    if (existingIds.isEmpty) {
      return 1;
    }
    // Итерировать от 1 до максимального ID + 1
    for (int i = 1; i <= existingIds.last; i++) {
      // Найти первое число, которое отсутствует в множестве
      if (!existingIds.contains(i)) {
        return i;
      }
    }

    // Если все числа от 1 до максимального ID заняты, вернуть максимальный ID + 1
    return trainers.last.id + 1;
  }
}
