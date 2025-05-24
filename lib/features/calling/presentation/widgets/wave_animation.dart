import 'package:children_police/core/constants/colors.dart';
import 'package:flutter/material.dart';

class WaveAnimation extends StatelessWidget {
  final Animation<double> animation;

  const WaveAnimation({required this.animation, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: List.generate(3, (index) {
            return Container(
              width: 100 + (index * 40) * animation.value,
              height: 100 + (index * 40) * animation.value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.white.withOpacity((1 - animation.value) * 0.5),
                  width: 2,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
