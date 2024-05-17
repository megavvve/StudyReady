import 'package:study_ready/domain/entities/chapter.dart';
import 'package:study_ready/domain/entities/subject.dart';
import 'package:study_ready/domain/entities/trainer.dart';

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
  static Theme findThemeByName(
      String? name, int subjectId, int chapterId, List<Trainer> trainerList) {
    if (name != null) {
      for (var trainer in trainerList) {
        for (var question in trainer.questions) {
          if (question.theme.name == name &&
              question.theme.subject.id == subjectId &&
              question.theme.chapter.id == chapterId) {
            return question.theme;
          }
        }
      }
    }

    return Theme(
        id: 1,
        subject: Subject(id: 1, name: ''),
        chapter: Chapter(id: 1, subjectId: 1, name: ''),
        name: '');
  }
}
