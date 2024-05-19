import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/user_model.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:study_ready/utils/app_colors.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

class UserProfileWidget extends StatelessWidget {
  final UserModel userModel;

  const UserProfileWidget({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(13.sp),
      width: 362.w,
      height: 90.h,
      decoration: BoxDecoration(
        color: brightness == Brightness.dark
            ? colorForMaterialCardDark
            : const Color(0xFFAEC6FF),
        borderRadius: BorderRadius.all(
          Radius.circular(16.sp),
        ),
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Positioned(
                child: duckBackground,
              ),
              Positioned(
                top: 10,
                left: 10,
                child: duck,
              ),
            ],
          ),
          SizedBox(
            width: 15.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${userModel.displayName}',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                'почта: ${userModel.email}',
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          // IconButton(
          //   icon: Icon(Icons.edit),
          //   onPressed: () {
          //     // Действие при нажатии на кнопку редактирования
          //   },
          // ),
        ],
      ),
    );
  }
}
