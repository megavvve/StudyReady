import 'package:study_ready/domain/entities/trainer.dart';

class Subject {
  int id;
  String name;
  Subject({
    required this.id,
    required this.name,
  });
  static Subject findSubjectByName(String? name, List<Trainer> trainerList) {
    if (name != null) {
      for (var trainer in trainerList) {
        for (var question in trainer.questions) {
          if (question.subject.name == name) {
            return question.subject;
          }
        }
      }
    }

    return Subject(id: 1, name: '');
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Метод fromMap для преобразования данных из Map в объект Subject
  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'],
      name: map['name'],
    );
  }
}
