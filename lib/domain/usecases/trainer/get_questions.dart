import 'package:study_ready/domain/entities/question.dart';
import 'package:study_ready/domain/repositories/trainer_repository/question_repository.dart';

class GetQuestions {
  QuestionRepository trainerRepository;
  GetQuestions({
    required this.trainerRepository,
  });
  Future<List<Question>> call() async {
    return await trainerRepository.getQuestionsFullInfo();
  }
}
