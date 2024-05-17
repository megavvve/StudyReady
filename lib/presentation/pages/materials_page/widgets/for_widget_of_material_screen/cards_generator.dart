import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/for_widget_of_material_screen/delete_mode.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/material_card.dart';

class CardsGenerator extends StatelessWidget {
  final List<StudyMaterial> itemsList;
  final DeleteMode deleteMode;
  const CardsGenerator(
      {super.key, required this.itemsList, required this.deleteMode});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: itemsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8.h,
        mainAxisSpacing: 10.h,
      ),
      itemBuilder: (BuildContext context, int index) => MaterialCard(
        studyMaterial: itemsList[index],
        deleteMode: deleteMode,
      ),
    );
  }
}
