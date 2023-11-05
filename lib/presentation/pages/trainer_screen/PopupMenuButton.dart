import 'package:flutter/material.dart';
// ?? как сделать

var a = PopupMenuButton<String>(
  itemBuilder: (BuildContext context) {
    return {'непра', 'дискра', 'аиг'}.map((String choice) {
      return PopupMenuItem<String>(
        value: choice,
        child: Text(choice),
      );
    }).toList();
  },
  child: TextButton.icon(
    onPressed: null,
    icon: const Icon(
      Icons.arrow_drop_down,
      color: Colors.black,
    ),
    label: const Text('Тип Тренировки'),
  ),
);
