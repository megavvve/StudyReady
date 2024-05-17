import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/add_question_screen.dart';

class AddTrainerDialog extends StatefulWidget {
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
  State<AddTrainerDialog> createState() => _AddTrainerDialogState();
}

class _AddTrainerDialogState extends State<AddTrainerDialog> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController trainerNameController = TextEditingController();
  final TextEditingController subjectNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    loadSharedPreferences();
  }

  @override
  void dispose() {
    trainerNameController.dispose();
    subjectNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> loadSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(
      () {
        trainerNameController.text =
            prefs.getString('trainerNameController') ?? '';
        subjectNameController.text =
            prefs.getString('subjectNameController') ?? '';
        descriptionController.text =
            prefs.getString('descriptionController') ?? '';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Добавить тренажер'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    validator: validate,
                    controller: trainerNameController,
                    decoration: InputDecoration(
                      labelText: 'Имя тренажера',
                      errorStyle: TextStyle(fontSize: 10.sp),
                      suffix: IconButton(
                        onPressed: () {
                          trainerNameController.clear();
                        },
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Color.fromARGB(155, 244, 67, 54),
                        ),
                      ),
                    ),
                    onChanged: (value) async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString("trainerNameController", value);
                    },
                  ),
                  TextFormField(
                    validator: validate,
                    controller: subjectNameController,
                    decoration: InputDecoration(
                      labelText: 'Название предмета',
                      errorStyle: TextStyle(fontSize: 10.sp),
                      suffix: IconButton(
                        onPressed: () {
                          subjectNameController.clear();
                        },
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Color.fromARGB(155, 244, 67, 54),
                        ),
                      ),
                    ),
                    onChanged: (value) async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString("subjectNameController", value);
                    },
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Описание',
                      suffix: IconButton(
                        onPressed: () {
                          descriptionController.clear();
                        },
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Color.fromARGB(155, 244, 67, 54),
                        ),
                      ),
                    ),
                    onChanged: (value) async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString("descriptionController", value);
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("Добавить в тренажер:", "");
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final newTrainer = Trainer(
                    id: Trainer.getNextTrainerId(widget.trainers),
                    trainerName: trainerNameController.text,
                    subjectName: subjectNameController.text,
                    description: descriptionController.text,
                    color: AddTrainerDialog.getRandomColorForCard(),
                    image: null,
                    questions: [],
                  );
                  BlocProvider.of<TrainerBloc>(context).add(
                    AddTrainer(
                      trainer: newTrainer,
                    ),
                  );
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("trainerNameController", '');
                  prefs.setString("subjectNameController", '');
                  prefs.setString("descriptionController", '');
                  String string =
                      "Тренажер: ${trainerNameController.text}, предмет: ${subjectNameController.text}";
                  prefs.setString("Добавить в тренажер:", string);
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const AddQustionScreen(),
                    ),
                  );
                }
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

  String? validate(String? value) {
    if (value!.isEmpty || value == "") {
      return "Ошибка! Поле не должно быть пустым!";
    } else if (!(validTrainer())) {
      return 'Ошибка! Такой тренажер уже есть';
    }
    return null;
  }

  bool validTrainer() {
    for (var i in widget.trainers) {
      if (i.trainerName.trim().toLowerCase() ==
              trainerNameController.text.trim().toLowerCase() &&
          i.subjectName.trim().toLowerCase() ==
              subjectNameController.text.trim().toLowerCase()) {
        return false;
      }
    }
    return true;
  }
}
