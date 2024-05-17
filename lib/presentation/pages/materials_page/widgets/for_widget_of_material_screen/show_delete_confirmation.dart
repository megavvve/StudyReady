import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showDeleteConfirmation(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Вы точно хотите удалить эти материалы?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Обработка нажатия кнопки "Удалить"
                    Navigator.of(context).pop(); // закрыть диалоговое окно
                    // Вызов метода удаления материалов
                    //_deleteMaterials();
                  },
                  child: const Text('Удалить'),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // закрыть диалоговое окно
                  },
                  child: const Text('Отмена'),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
