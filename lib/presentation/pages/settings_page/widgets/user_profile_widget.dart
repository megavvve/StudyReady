import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/user_model.dart';

class UserProfileWidget extends StatelessWidget {
  final UserModel userModel;

  const UserProfileWidget({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 362.w,
      height: 70.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Email: ${userModel.email}',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                'Display Name: ${userModel.displayName}',
                style: TextStyle(fontSize: 12.sp),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Действие при нажатии на кнопку редактирования
            },
          ),
        ],
      ),
    );
  }
}
