import 'package:study_ready/presentation/pages/trainer_page/add_answer/widgets_add_answer/inherit_for_question_and_answers.dart';

bool isEmptyTextField(QuestionControllers controllers) {
  return controllers.questionController.text.isEmpty ||
      controllers.answerController1.text.isEmpty ||
      controllers.answerController2.text.isEmpty ||
      controllers.answerController3.text.isEmpty ||
      controllers.answerController4.text.isEmpty;
}
