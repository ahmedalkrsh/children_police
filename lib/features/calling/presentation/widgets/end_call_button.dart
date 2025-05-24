import 'package:children_police/core/constants/colors.dart';
import 'package:children_police/core/constants/sizes.dart';
import 'package:children_police/core/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class EndCallButton extends StatelessWidget {
  final VoidCallback onTap;

  const EndCallButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.paddingMedium),
      child: GradientButton(
        gradientColors: [AppColors.redLight400, AppColors.redDark600],
        icon: Icons.call_end,
        size: AppSizes.buttonSizeSmall,
        onTap: onTap,
      ),
    );
  }
}
