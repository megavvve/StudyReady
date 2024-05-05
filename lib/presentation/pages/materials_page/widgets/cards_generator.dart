import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/material_card.dart';

class CardsGenerator extends StatefulWidget {
  final List<StudyMaterial> itemsList;
  const CardsGenerator({super.key, required this.itemsList});

  @override
  State<CardsGenerator> createState() => _CardsGeneratorState();
}

class _CardsGeneratorState extends State<CardsGenerator> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: widget.itemsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8.h,
        mainAxisSpacing: 10.h,
      ),
      itemBuilder: (BuildContext context, int index) => MaterialCard(
        studyMaterial: widget.itemsList[index],
      ),
    );
  }
}
