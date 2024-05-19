import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_ready/data/datasources/local/app_db.dart';
import 'package:study_ready/domain/entities/auth.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/injection_container.dart';
import 'package:study_ready/main.dart';
import 'package:study_ready/presentation/blocs/study_material_bloc/study_material_bloc.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/navigation/router_wihout_animation.dart';

class SignOutButton extends StatefulWidget {
  const SignOutButton({super.key});

  @override
  State<SignOutButton> createState() => _SignOutButtonState();
}

class _SignOutButtonState extends State<SignOutButton> {
  Future<void> _signOut(BuildContext context, List<Trainer> trainerList,
      List<StudyMaterial> materialList) async {
    try {
      await Auth().signout();
      await AppDB().deleteAllMaterials();
      GetIt.instance.reset();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.clear();
      SharedPreferences sharedPreferencesd =
          await SharedPreferences.getInstance();
      await main();
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        routerWithoutAnimation(
          MyApp(
            preferences: sharedPreferencesd,
          ),
        ),
      );
    } catch (e) {
      // Обработка ошибок
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка при выходе: $e'),
        ),
      );
    }
  }

  List<Trainer> trainerList = [];

  List<StudyMaterial> materialList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        if (state is TrainerLoadSuccess) {
          trainerList = state.trainerList;
        }
        return BlocBuilder<StudyMaterialBloc, StudyMaterialState>(
          builder: (context, state) {
            if (state is StudyMaterialLoadSuccess) {
              materialList = state.materials;
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: SizedBox(
                width: 362.w,
                height: 70.h,
                child: ElevatedButton(
                  onPressed: () => _signOut(context, trainerList, materialList),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.sp),
                    ),
                  ),
                  child: Text(
                    'Выйти',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
