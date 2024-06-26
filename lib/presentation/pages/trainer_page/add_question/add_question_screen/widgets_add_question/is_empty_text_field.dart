import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isEmptyTextField() {
  SharedPreferences prefs = GetIt.instance.get<SharedPreferences>();

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
