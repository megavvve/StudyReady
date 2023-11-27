import 'dart:math';

List<String> generateRandomAnswers(
    String correctAnswer, List<String> incorrectAnswers) {
  List<String> answers = [];

  // Добавляем правильный ответ в список
  answers.add(correctAnswer);

  // Добавляем три неправильных ответа
  answers.addAll(incorrectAnswers);

  // Перемешиваем список, чтобы порядок ответов был случайным
  answers.shuffle();

  return answers;
}
