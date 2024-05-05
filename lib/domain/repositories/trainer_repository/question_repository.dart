// Methods for Questions
import 'package:study_ready/domain/entities/question.dart';

abstract class QuestionRepository {
  Future<List<Question>> getQuestionsFullInfo();
  Future<Question> getQuestionFullInfoById(int id);
  Future<Question> getQuestion(int id);
  Future<bool> updateQuestion(Question question);
  Future<int> insertQuestion(Question question);
  Future<int> deleteQuestion(int id);
}
