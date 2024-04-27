import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:study_ready/presentation/blocs/study_material_bloc/study_material_bloc.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/material_screen_widget.dart';
import 'package:study_ready/utils/app_colors.dart';

class MaterialScreen extends StatefulWidget {
  const MaterialScreen({Key? key}) : super(key: key);

  @override
  State<MaterialScreen> createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudyMaterialBloc, StudyMaterialState>(
      builder: (context, state) {
        if (state is StudyMaterialLoadSuccess) {
          final listMaterial = state.materials;
          for (var element in listMaterial) {
            print(element.fileType);
          }
          return MaterialScreenWidget(
            materialList: listMaterial,
          );
        } else if (state is StudyMaterialError) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const Text(
                    "Не удалось получить данные при первом входе в приложение.\nПожалуйста, проверьте подключение к интернету."),
              ),
            ),
          );
        } else {
          return Scaffold(
            drawer: const NavigatorDrawer(),
            backgroundColor: backgroundColor,
            body: Center(
              child: LoadingAnimationWidget.inkDrop(
                size: 40.sp,
                color: mainColor,
              ),
            ),
          );
        }
      },
    );
  }
}
