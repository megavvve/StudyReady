import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/for_widget_of_material_screen/delete_mode_for_materials.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/material_card.dart';

class CardsGenerator extends StatelessWidget {
  final DeleteModeForMaterials deleteMode;
  final String query;
  const CardsGenerator({
    super.key,
    required this.deleteMode,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    // if (deleteMode.boolForBugWithBlocList) {
    //   deleteMode.listOfStudyMaterials.removeLast();
    //   deleteMode.boolForBugWithBlocList = false;
    // }
    List<StudyMaterial> itemsList = deleteMode.listOfStudyMaterials
        .where(
          (material) => material.fileName.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
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
