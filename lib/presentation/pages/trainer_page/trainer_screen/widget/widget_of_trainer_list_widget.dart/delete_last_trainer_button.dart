import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteLastTrainerButton extends StatefulWidget {
  final VoidCallback onPressed;

  const DeleteLastTrainerButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  _DeleteLastTrainerButtonState createState() =>
      _DeleteLastTrainerButtonState();
}

class _DeleteLastTrainerButtonState extends State<DeleteLastTrainerButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
        _controller.forward(from: 0.0);
      },
      child: RotationTransition(
        turns: Tween<double>(begin: 0, end: 1).animate(_controller),
        child: Container(
          width: 100.w,
          height: 35.h,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.7),
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: Center(
            child: Text(
              'Удалить последний тренажер',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
