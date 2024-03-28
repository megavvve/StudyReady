import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/add_question_screen.dart';

class AddTrainerDialog extends StatelessWidget {
  final List<Trainer> trainers;

  const AddTrainerDialog({
    Key? key,
    required this.trainers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController trainerNameController = TextEditingController();

    TextEditingController subjectNameController = TextEditingController();

    TextEditingController descriptionController = TextEditingController();
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Добавить тренажер'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: trainerNameController,
                  decoration: const InputDecoration(labelText: 'Имя тренажера'),
                ),
                TextField(
                  controller: subjectNameController,
                  decoration:
                      const InputDecoration(labelText: 'Название предмета'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Описание'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("Добавить в тренажер:", "");
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const AddQustionScreen(),
                    transitionDuration: Duration.zero, // Нет анимации
                  ),
                );
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () async {
                final newTrainer = Trainer(
                  id: Trainer.getNextTrainerId(trainers),
                  trainerName: trainerNameController.text,
                  subjectName: subjectNameController.text,
                  description: descriptionController.text,
                  color: null, // цвет и изображение пока оставим null
                  image: null,
                  questions: [], // пока не содержит вопросов
                );
                BlocProvider.of<TrainerBloc>(context).add(
                  AddTrainer(
                    trainer: newTrainer,
                  ),
                );

                SharedPreferences prefs = await SharedPreferences.getInstance();

                String string =
                    "Тренажер: ${trainerNameController.text}, предмет: ${subjectNameController.text}";
                prefs.setString("Добавить в тренажер:", string);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const AddQustionScreen(),
                ));
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }
}
