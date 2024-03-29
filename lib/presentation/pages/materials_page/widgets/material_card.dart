import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/material_reader.dart';
import 'package:study_ready/utils/app_colors.dart';

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
        color: Colors.white,
        elevation: 6,
        //margin: EdgeInsets.all(8.sp),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                studyMaterial.fileName,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (studyMaterial.uploadDate == '')
                      ? Text('')
                      : Text(
                          '${DateTime.parse(studyMaterial.uploadDate).year}-${DateTime.parse(studyMaterial.uploadDate).month}-${DateTime.parse(studyMaterial.uploadDate).day}',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic),
                        ),
                  Icon(
                    Icons.picture_as_pdf,
                    size: 30.sp,
                    color: mainColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
