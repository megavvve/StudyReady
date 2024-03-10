import 'package:flutter/material.dart';
import 'package:study_ready/domain/entities/m_material.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/material_card.dart';

class CardsGenerator extends StatelessWidget {
  final List<MMaterial> itemsList;
  const CardsGenerator({super.key, required this.itemsList});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: itemsList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) => MaterialCard(
        topic: itemsList[index].topic,
        text: itemsList[index].text,
      ),
    );
  }
}
