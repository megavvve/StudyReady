import 'package:flutter/material.dart';

class SharedState extends InheritedWidget {
  final int selectedIndex;
  final int selectedQuestion;
  final int
      howmuchQuestion; // СКОЛЬКО ВСЕГО ВОПРОСОВ В НАШЕМ КОНКРЕТНОМ ТРЕНАЖОРЕ
  final Function(int) updateSelectedIndex;
  final Function(int) updateselectedQuestion;
  final List<String> answerQuestion;

   SharedState( {
    super.key,
    required this.selectedIndex,
    required this.updateSelectedIndex,
    required this.selectedQuestion,
    required this.updateselectedQuestion,
    required this.howmuchQuestion,
    required Widget child,
    required this.answerQuestion,
  }) : super(child: child);

  static SharedState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SharedState>()!;
  }

  @override
  bool updateShouldNotify(SharedState oldWidget) {
    return true;
    //return oldWidget.selectedIndex != selectedIndex;
  }
  
bool _answersGenerated = false;

  final List<String> _randomAnswers = [];
  List<String> generateRandomAnswers(
      String correctAnswer, List<String> incorrectAnswers) {
    if (!_answersGenerated) {
      // Добавляем правильный ответ в список
      _randomAnswers.add(correctAnswer);

      // Добавляем три неправильных ответа
      _randomAnswers.addAll(incorrectAnswers);

      // Перемешиваем список, чтобы порядок ответов был случайным
      _randomAnswers.shuffle();

      // Устанавливаем флаг, что лист ответов был сгенерирован
      _answersGenerated = true;
    }

    return _randomAnswers;
  }

  void resetAnswers() {
    _answersGenerated = false;
    _randomAnswers.clear();
  }
}
