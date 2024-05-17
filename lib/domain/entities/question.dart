import 'package:study_ready/domain/entities/chapter.dart';
import 'package:study_ready/domain/entities/subject.dart';
import 'package:study_ready/domain/entities/theme.dart';
import 'package:study_ready/domain/entities/trainer.dart';

class Question {
  final int id;

  final int courseNumber;

  final Subject subject;

  final Chapter chapter;

  final Theme theme;

  final String difficultly;

  final String questionContext;

  final String rightAnswer;

  final List<String> incorrectAnswers;

  Question({
    required this.id,
    required this.courseNumber,
    required this.subject,
    required this.chapter,
    required this.theme,
    required this.difficultly,
    required this.questionContext,
    required this.rightAnswer,
    required this.incorrectAnswers,
  });
  static int getNextId(List<Trainer> trainerList) {
    int maxId = 0;
    for (var trainer in trainerList) {
      for (var question in trainer.questions) {
        if (question.id > maxId) {
          maxId = question.id;
        }
      }
    }
    return maxId + 1;
  }
}
