import 'package:flutter/material.dart';

class DeleteLastTrainerAlertDialog extends StatelessWidget {
  const DeleteLastTrainerAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Невозможно удалить тренажер'),
      content: const Text('Вы не можете удалить последний оставшийся тренажер'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Закрыть диалоговое окно
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
