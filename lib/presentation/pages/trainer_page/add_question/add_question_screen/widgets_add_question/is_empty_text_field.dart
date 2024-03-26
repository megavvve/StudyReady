import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isEmptyTextField() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String question = prefs.getString("question") ?? "";
  String answer1 = prefs.getString("answer1") ?? "";
  String answer2 = prefs.getString("answer2") ?? "";
  String answer3 = prefs.getString("answer3") ?? "";
  String answer4 = prefs.getString("answer4") ?? "";
  String addToTrainer = prefs.getString("Добавить в тренажер:") ?? "";

  return question.isEmpty ||
      answer1.isEmpty ||
      answer2.isEmpty ||
      answer3.isEmpty ||
      answer4.isEmpty ||
      addToTrainer.isEmpty;
}
