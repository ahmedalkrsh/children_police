import 'package:children_police/core/constants/colors.dart';
import 'package:children_police/core/constants/sizes.dart';
import 'package:children_police/core/widgets/bolice_bage.dart';
import 'package:flutter/material.dart';

class PulseBadge extends StatelessWidget {
  final Animation<double> animation;

  const PulseBadge({required this.animation, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.scale(
          scale: animation.value,
          child: PoliceBadge(
            color: AppColors.white,
            size: AppSizes.buttonSizeSmall,
            icon: Icons.local_police,
          ),
        );
      },
    );
  }
}
