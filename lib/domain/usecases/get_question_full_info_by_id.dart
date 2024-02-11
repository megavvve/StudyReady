import 'package:study_ready/domain/entities/question.dart';
import 'package:study_ready/domain/repositories/question_repository.dart';

class GetQuestionFullInfoById {
  QuestionRepository questionRepository;
  GetQuestionFullInfoById({
    required this.questionRepository,
  });
  Future<Question> call(int id) async {
    return await questionRepository.getQuestionFullInfoById(id);
  }
}
