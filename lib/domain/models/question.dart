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

  Question({
    required this.id,
    required this.courseNumber,
    required this.subject,
    required this.chapter,
    required this.theme,
    required this.difficultly,
    required this.questionContext,
    required this.rightAnswer,
    required this.incorrectAnswers,
  });
}
