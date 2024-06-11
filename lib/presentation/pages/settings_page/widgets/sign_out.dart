import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_ready/data/datasources/local/app_db.dart';
import 'package:study_ready/domain/entities/auth.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/domain/entities/trainer.dart';

import 'package:study_ready/main.dart';
import 'package:study_ready/presentation/blocs/study_material_bloc/study_material_bloc.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';

import 'package:study_ready/presentation/pages/settings_page/widgets/check_intener_connection.dart';
import 'package:study_ready/utils/app_colors.dart';

class SignOutButton extends StatefulWidget {
  const SignOutButton({super.key});

  @override
  State<SignOutButton> createState() => _SignOutButtonState();
}

class _SignOutButtonState extends State<SignOutButton> {
  Future<void> _signOut(BuildContext context, List<Trainer> trainerList,
      List<StudyMaterial> materialList) async {
    try {
      if (!await checkInternetConnection()) {
        showNoInternetDialog(context);
      }
      await AppDB().deleteAllMaterials();
      GetIt.instance.reset();
      SharedPreferences prefs = GetIt.instance.get<SharedPreferences>();
      prefs.clear();
      SharedPreferences sharedPreferencesd =
          await SharedPreferences.getInstance();
      await Auth().signout();
      await main();
      Navigator.pushReplacement(
        context,
        customPageRoute(
          MyApp(
            preferences: sharedPreferencesd,
          ),
        ),
      );
    } catch (e) {
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
    final brightness = context.watch<ThemeCubit>().state.brightness;
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
              //width: 30.w,
              // color: mainColorDark,
              // height: 70.h,
              child: TextButton(
                onPressed: () => _signOut(context, trainerList, materialList),
                style: ElevatedButton.styleFrom(
                  backgroundColor: brightness == Brightness.dark
                      ? colorForButton
                      : mainColorLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.sp),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Выйти',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
