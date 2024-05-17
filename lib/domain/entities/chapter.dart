// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:study_ready/domain/entities/trainer.dart';

class Chapter {
  int id;

  int subjectId;

  String name;
  Chapter({
    required this.id,
    required this.subjectId,
    required this.name,
  });
  static Chapter findChapterByName(
      String? name, int subjectId, List<Trainer> trainerList) {
    if (name != null) {
      for (var trainer in trainerList) {
        for (var question in trainer.questions) {
          if (question.chapter.name == name &&
              question.chapter.subjectId == subjectId) {
            return question.chapter;
          }
        }
      }
    }

    return Chapter(id: 1, subjectId: 1, name: '');
  }
}
