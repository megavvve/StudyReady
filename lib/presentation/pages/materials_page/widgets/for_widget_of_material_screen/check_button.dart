import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckButton extends StatefulWidget {
  final bool isChecked;

  const CheckButton({
    required this.isChecked,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CheckButtonState createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.w,
      height: 25.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.isChecked ? Colors.green : Colors.transparent,
        border: Border.all(color: Colors.green),
      ),
      child: widget.isChecked
          ? const Icon(Icons.check, color: Colors.white)
          : const SizedBox(), // Пустая иконка, когда кнопка не активна
    );
  }
}
