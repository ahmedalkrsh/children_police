import 'package:children_police/core/constants/colors.dart';
import 'package:flutter/material.dart';

class SoundWaveIndicator extends StatelessWidget {
  final AnimationController controller;

  const SoundWaveIndicator({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              width: 4,
              height: 20 + (index * 5) * (0.5 + 0.5 * (1 + controller.value).abs()),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            );
          },
        );
      }),
    );
  }
}
