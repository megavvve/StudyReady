class LocalQuestion {
  final int id;
  final int course;
  final String subject;
  final String chapter;
  final String theme;
  final String difficultly;
  final String context;
  final String rightAnswer;
  final List<String> incorrectAnswers;

  LocalQuestion(
      {required this.id,
      required this.course,
      required this.subject,
      required this.chapter,
      required this.theme,
      required this.difficultly,
      required this.context,
      required this.rightAnswer,
      required this.incorrectAnswers});
}
