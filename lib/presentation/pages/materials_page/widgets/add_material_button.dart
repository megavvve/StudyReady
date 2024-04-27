import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';
import 'package:study_ready/presentation/pages/materials_page/add_material/add_material_screen.dart';

class AddMaterialButton extends StatelessWidget {
  const AddMaterialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.w,
      height: 70.h,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).push(
              customPageRoute(
                AddFilesScreen(),
              ),
            );
          },
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
