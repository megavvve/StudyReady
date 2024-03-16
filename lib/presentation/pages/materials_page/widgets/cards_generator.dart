import 'package:flutter/material.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/material_card.dart';

class CardsGenerator extends StatelessWidget {
  final List<StudyMaterial> itemsList;
  const CardsGenerator({super.key, required this.itemsList});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: itemsList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) => MaterialCard(
        topic: itemsList[index].title,
        text: itemsList[index].content,
      ),
    );
  }
}
