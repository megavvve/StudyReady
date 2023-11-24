class Question {
  final int id;

  final int courseNumber;

  final int subjectId;

  final int chapterId;

  final int themeId;

  final String difficultly;

  final String questionContext;

  final String rightAnswer;

  final List<String> incorrectAnswers;

  Question(
    this.id,
    this.courseNumber,
    this.subjectId,
    this.chapterId,
    this.themeId,
    this.difficultly,
    this.questionContext,
    this.rightAnswer,
    this.incorrectAnswers,
  );
}
