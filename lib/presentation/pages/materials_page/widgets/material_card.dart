import 'package:flutter/material.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/material_reader.dart';

class MaterialCard extends StatelessWidget {
  final StudyMaterial studyMaterial;

  const MaterialCard({
    required this.studyMaterial,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MaterialReader(
                      material: studyMaterial,
                    )));
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                studyMaterial.fileName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
