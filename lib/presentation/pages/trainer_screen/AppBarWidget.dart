import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'PopupMenuButton.dart';

void handleClick(String value) {
  switch (value) {
    case 'непра':
      break;
    case 'дискра':
      break;
    case 'аиг':
      break;
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.menu),
      actions: <Widget>[
        PopupMenuButton<String>(
          itemBuilder: (BuildContext context) {
            return {'Тренировка 1', 'Тренировка 2', 'Тренировка 3'}.map((String choice) {
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
        ),
        PopupMenuButton<String>(
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
            icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
            label: const Text('Выбор Предмета'),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
