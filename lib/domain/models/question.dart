class Question {
  final int id;

  final int courseNumber;

  final String subject;

  final String chapter;

  final String theme;

  final String difficultly;

  final String questionContext;

  final String rightAnswer;

  final List<String> incorrectAnswers;

  Question(
    this.id,
    this.courseNumber,
    this.subject,
    this.chapter,
    this.theme,
    this.difficultly,
    this.questionContext,
    this.rightAnswer,
    this.incorrectAnswers,
  );
   
}
