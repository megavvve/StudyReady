import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/for_widget_of_material_screen/delete_mode.dart';

void showDeleteConfirmation(BuildContext context, DeleteMode deleteMode) {
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
                    deleteMode.deleteMaterials = true;
                    Navigator.of(context).pop(); // Закрываем диалоговое окно
                  },
                  child: const Text('Удалить'),
                ),
                OutlinedButton(
                  onPressed: () {
                    deleteMode.deleteMaterials = false;
                    Navigator.of(context).pop(); // Закрываем диалоговое окно
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
