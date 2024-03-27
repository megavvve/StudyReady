import 'dart:math';

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

  static String? getRandomColorForCard() {
    const List<String> colors = [
      "0xFF7C97FF",
      "0xFF9496F4",
      "0xFFF67791",
      "0xFFE3945F",
    ];
    return colors[Random().nextInt(3)];
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController trainerNameController = TextEditingController();

    TextEditingController subjectNameController = TextEditingController();

    TextEditingController descriptionController = TextEditingController();
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Add Trainer'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: trainerNameController,
                  decoration: const InputDecoration(labelText: 'Trainer Name'),
                ),
                TextField(
                  controller: subjectNameController,
                  decoration: const InputDecoration(labelText: 'Subject Name'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
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
                  color:
                      getRandomColorForCard(), // цвет и изображение пока оставим null
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
