import 'package:children_police/core/constants/images.dart';
import 'package:flutter/material.dart';

class LogoPulse extends StatelessWidget {
  final Animation<double> animation;

  const LogoPulse({required this.animation, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.scale(
          scale: 0.95 + 0.05 * animation.value,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.4), width: 2),
              image:  DecorationImage(
                image: AssetImage(Assets.logo),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
