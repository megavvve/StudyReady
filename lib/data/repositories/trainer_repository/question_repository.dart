import 'package:get_it/get_it.dart';
import 'package:study_ready/data/datasources/local/app_db.dart';
import 'package:study_ready/data/datasources/local/models/local_question_db.dart';
import 'package:study_ready/data/mapper/question_mapper.dart';
import 'package:study_ready/domain/entities/question.dart';
import 'package:study_ready/domain/repositories/trainer_repository/question_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  AppDB appDB = GetIt.instance.get<AppDB>();
  @override
  Future<int> deleteQuestion(int id) {
    return appDB.deleteQuestion(id);
  }

  @override
  Future<Question> getQuestion(int id) async {
    QuestionTableData questionTableData = await appDB.getQuestion(id);
    return QuestionMapper.fromQuestionTableData(questionTableData);
  }

  @override
  Future<Question> getQuestionFullInfoById(int id) async {
    LocalQuestion localQuestion = await appDB.getQuestionFullInfoById(id);
    return QuestionMapper.fromLocalQuestion(localQuestion);
  }

  @override
  Future<List<Question>> getQuestionsFullInfo() async {
    List<LocalQuestion> localQuestions = await appDB.getQuestionsFullInfo();

    return _convertToFutureList(
        QuestionMapper.fromLocalQuestions(localQuestions));
  }

  @override
  Future<int> insertQuestion(Question question) {
    return appDB.insertQuestion(
      QuestionMapper.toQuestionTableCompanion(
        question,
      ),
    );
  }

  @override
  Future<bool> updateQuestion(Question question) {
    return appDB.updateQuestion(
      QuestionMapper.toQuestionTableCompanion(
        question,
      ),
    );
  }
}

Future<List<Question>> _convertToFutureList(
    List<Future<Question>> futureList) async {
  // Дождаться выполнения всех будущих в списке и получить список результатов
  List<Question> questions = await Future.wait(futureList);
  return questions;
}
