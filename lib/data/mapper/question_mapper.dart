import 'package:drift/drift.dart';
import 'package:get_it/get_it.dart';
import 'package:study_ready/data/datasources/local/app_db.dart';
import 'package:study_ready/data/datasources/local/models/local_question_db.dart';
import 'package:study_ready/data/mapper/chapter_mapper.dart';
import 'package:study_ready/data/mapper/subject_mapper.dart';
import 'package:study_ready/data/mapper/theme_mapper.dart';
import 'package:study_ready/domain/entities/chapter.dart';
import 'package:study_ready/domain/entities/question.dart';
import 'package:study_ready/domain/entities/subject.dart';
import 'package:study_ready/domain/entities/theme.dart';

class QuestionMapper {
  AppDB appDB = GetIt.instance.get<AppDB>();
  static Future<Question> fromLocalQuestion(LocalQuestion localQuestion) async {
    final subjectId = SubjectMapper().getSubjectIdByName(
      localQuestion.subject,
    );
    final themeId = ThemeMapper().getThemeIdByName(
      localQuestion.theme,
    );
    final chapterId = ChapterMapper().getChapterIdByName(
      localQuestion.chapter,
    );
    return Question(
      id: localQuestion.id,
      courseNumber: localQuestion.course,
      subject: Subject(
        id: await subjectId,
        name: localQuestion.subject,
      ),
      chapter: Chapter(
        id: await chapterId,
        subjectId: await subjectId,
        name: localQuestion.chapter,
      ),
      theme: Theme(
          id: await themeId,
          subject: Subject(
            id: await subjectId,
            name: localQuestion.subject,
          ),
          chapter: Chapter(
            id: await chapterId,
            subjectId: await subjectId,
            name: localQuestion.chapter,
          ),
          name: localQuestion.theme),
      difficultly: localQuestion.difficultly,
      questionContext: localQuestion.context,
      rightAnswer: localQuestion.rightAnswer,
      incorrectAnswers: localQuestion.incorrectAnswers,
    );
  }

  static LocalQuestion toLocalQuestion(Question question) {
    return LocalQuestion(
      id: question.id,
      course: question.courseNumber,
      subject: question.subject.name,
      chapter: question.chapter.name,
      theme: question.theme.name,
      difficultly: question.difficultly,
      context: question.questionContext,
      rightAnswer: question.rightAnswer,
      incorrectAnswers: question.incorrectAnswers,
    );
  }

  static List<Future<Question>> fromLocalQuestions(
      List<LocalQuestion> localQuestions) {
    return localQuestions
        .map((localQuestion) => QuestionMapper.fromLocalQuestion(localQuestion))
        .toList();
  }

  static List<LocalQuestion> toLocalQuestions(List<Question> localQuestions) {
    return localQuestions
        .map((localQuestion) => toLocalQuestion(localQuestion))
        .toList();
  }

  static QuestionTableCompanion toQuestionTableCompanion(Question question) {
    return QuestionTableCompanion(
      id: Value(question.id),
      courseNumber: Value(question.courseNumber),
      subjectId: Value(question.subject.id),
      chapterId: Value(question.chapter.id),
      themeId: Value(question.theme.id),
      difficultly: Value(question.difficultly),
      questionContext: Value(question.questionContext),
      rightAnswer: Value(question.rightAnswer),
      incorrectAnswers: Value(question.incorrectAnswers),
    );
  }

  static List<QuestionTableCompanion> toQuestionsTableCompanion(
      List<Question> questions) {
    return questions
        .map((question) => toQuestionTableCompanion(question))
        .toList();
  }

  static List<String> toStringIdList(List<Question> companions) {
    return companions.map((companion) => companion.id.toString()).toList();
  }

  static Future<List<Question>> fromStringIds(
      List<String> ids, List<Question> allQuestions) async {
    List<Question> questions = [];
    for (String id in ids) {
      for (Question question in questions) {
        if (int.parse(id) == question.id) {
          questions.add(question);
          break;
        }
      }
    }
    return questions;
  }

  static Future<Question> fromQuestionTableData(
      QuestionTableData questionTableData) async {
    final subjectTableData =
        await SubjectMapper().getSubjectById(questionTableData.subjectId);
    final chapterTableData =
        await ChapterMapper().getChapterById(questionTableData.chapterId);
    final themeTableData =
        await ThemeMapper().getThemeById(questionTableData.themeId);
    return Question(
      id: questionTableData.id,
      courseNumber: questionTableData.courseNumber,
      subject: SubjectMapper.fromSubjectTableData(subjectTableData),
      chapter: ChapterMapper.fromChapterTableData(chapterTableData),
      theme: ThemeMapper.fromThemeTableData(themeTableData),
      difficultly: questionTableData.difficultly,
      questionContext: questionTableData.questionContext,
      rightAnswer: questionTableData.rightAnswer,
      incorrectAnswers: questionTableData.incorrectAnswers,
    );
  }

  static Future<Question> fromQuestionTableCompanion(
      QuestionTableCompanion questionTableCompanion) async {
    final subjectTableData = await SubjectMapper()
        .getSubjectById(questionTableCompanion.subjectId.value);
    final chapterTableData = await ChapterMapper()
        .getChapterById(questionTableCompanion.chapterId.value);
    final themeTableData =
        await ThemeMapper().getThemeById(questionTableCompanion.themeId.value);
    return Question(
      id: questionTableCompanion.id.value,
      courseNumber: questionTableCompanion.courseNumber.value,
      subject: SubjectMapper.fromSubjectTableData(subjectTableData),
      chapter: ChapterMapper.fromChapterTableData(chapterTableData),
      theme: ThemeMapper.fromThemeTableData(themeTableData),
      difficultly: questionTableCompanion.difficultly.value,
      questionContext: questionTableCompanion.questionContext.value,
      rightAnswer: questionTableCompanion.rightAnswer.value,
      incorrectAnswers: questionTableCompanion.incorrectAnswers.value,
    );
  }
}
