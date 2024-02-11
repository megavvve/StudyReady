import 'package:study_ready/domain/entities/chapter.dart';
import 'package:study_ready/domain/entities/subject.dart';
import 'package:study_ready/domain/entities/theme.dart';

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
}
