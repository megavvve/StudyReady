import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/material_reader_pick.dart';
import 'package:study_ready/utils/app_colors.dart';

class MaterialCard extends StatefulWidget {
  final StudyMaterial studyMaterial;

  const MaterialCard({
    required this.studyMaterial,
    Key? key,
  }) : super(key: key);

  @override
  State<MaterialCard> createState() => _MaterialCardState();
}

class _MaterialCardState extends State<MaterialCard> {
  bool onLongPress = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MaterialReaderPick(
              material: widget.studyMaterial,
            ),
          ),
        );
      },
      onLongPress: () {
        setState(() {
          onLongPress = true;
        });
      },
      child: Card(
        color: onLongPress ? Colors.amber : Colors.white,
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.studyMaterial.fileName,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (widget.studyMaterial.uploadDate == '')
                      ? const Text('')
                      : Text(
                          '${DateTime.parse(widget.studyMaterial.uploadDate).year}-${DateTime.parse(widget.studyMaterial.uploadDate).month}-${DateTime.parse(widget.studyMaterial.uploadDate).day}',
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
