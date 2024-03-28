import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            ),
          ),
        );
      },
      child: Card(
        surfaceTintColor: Colors.transparent,
        color: Colors.white,
        shadowColor: Colors.white,
        elevation: 4,
        margin: EdgeInsets.all(8.sp),
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                studyMaterial.fileName,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
