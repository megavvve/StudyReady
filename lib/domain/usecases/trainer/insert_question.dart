import 'package:study_ready/domain/entities/question.dart';
import 'package:study_ready/domain/repositories/trainer_repository/question_repository.dart';

class InsertQuestion {
  QuestionRepository questionRepository;
  InsertQuestion({
    required this.questionRepository,
  });
  Future<int> call(Question question) async {
    return await questionRepository.insertQuestion(question);
  }
}
