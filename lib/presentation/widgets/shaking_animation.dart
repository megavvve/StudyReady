import 'package:flutter/material.dart';

class ShakingAnimation extends StatefulWidget {
  final Widget child;
  final bool isActive;

  const ShakingAnimation({
    Key? key,
    required this.child,
    this.isActive = false,
  }) : super(key: key);

  @override
  _ShakingAnimationState createState() => _ShakingAnimationState();
}

class _ShakingAnimationState extends State<ShakingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationX;
  late Animation<double> _animationY;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 300), // Увеличенная длительность для плавности
    );

    _animationX = Tween<double>(begin: -1.0, end: 1.0)
        .chain(CurveTween(curve: Curves.easeInOut)) // Плавная кривая анимации
        .animate(_controller);
    _animationY = Tween<double>(begin: -1.0, end: 1.0)
        .chain(CurveTween(curve: Curves.easeInOut)) // Плавная кривая анимации
        .animate(_controller);

    if (widget.isActive) {
      _controller.repeat(
          reverse: true,
          period: Duration(milliseconds: 100)); // Частая анимация
    }
  }

  @override
  void didUpdateWidget(ShakingAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _controller.repeat(reverse: true, period: Duration(milliseconds: 100));
      } else {
        _controller.stop();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animationX.value, _animationY.value),
          child: widget.child,
        );
      },
    );
  }
}
