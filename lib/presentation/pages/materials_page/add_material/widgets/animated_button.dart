import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_colors.dart';

class AnimatedPulseButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Duration duration;
  final Duration interval; // Add this line

  const AnimatedPulseButton({
    Key? key,
    this.onPressed,
    this.duration = const Duration(seconds: 1),
    this.interval = const Duration(seconds: 10), // Add this line
  }) : super(key: key);

  @override
  AnimatedPulseButtonState createState() => AnimatedPulseButtonState();
}

class AnimatedPulseButtonState extends State<AnimatedPulseButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _innerUpscale;
  late final Animation<double> _innerDownscale;
  bool _isAnimating = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _innerUpscale = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.3, curve: Curves.ease),
    ).drive(Tween<double>(begin: 1.0, end: 1.5));
    _innerDownscale = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.7, 1.0, curve: Curves.ease),
    ).drive(Tween<double>(begin: 1.0, end: 1.0 / 1.5));

    _startAnimation(); // Add this line
  }

  @override
  void dispose() {
    _isAnimating = false; // Add this line
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() async {
    while (_isAnimating) {
      await _controller.forward();
      await _controller.reverse();
      await Future.delayed(widget.interval);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed?.call();
        _controller.reset();
        _controller.forward();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: 170,
            child: Transform.scale(
              scale: _innerUpscale.value * _innerDownscale.value,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 3),
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                  color: thirdColor,
                  borderRadius: BorderRadius.circular(14.sp),
                ),
                width: 170.w,
                height: 50.h,
                alignment: Alignment.center,
                child: Text(
                  "Сохранить",
                  style: TextStyle(
                    fontSize: 20.0.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
