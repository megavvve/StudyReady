import 'package:study_ready/domain/entities/trainer.dart';

List<Trainer> sortTrainers(String sortBy, List<Trainer> trainers) {
  switch (sortBy) {
    case 'По умолчанию':
      trainers.sort((a, b) => a.id.compareTo(b.id));
      break;
    case 'По названию тренажера':
      trainers.sort((a, b) => a.trainerName.compareTo(b.trainerName));
      break;
    case 'По названию предмета':
      trainers.sort((a, b) => a.subjectName.compareTo(b.subjectName));
    case 'По количеству вопросов':
      trainers.sort((a, b) => b.questions.length.compareTo(a.questions.length));
    default:
      break;
  }
  return trainers;
}
