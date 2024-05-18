import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/delete_mode_for_trainers.dart';

void showDeleteConfirmirm(
    BuildContext context, DeleteModeForTrainers deleteMode, Trainer trainer) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Вы точно хотите удалить этот тренажер?',
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
                    deleteMode.trainersForDelete = [trainer];
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
