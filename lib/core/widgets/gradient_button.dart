import 'package:children_police/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:children_police/core/constants/sizes.dart';

// زر متدرج دائري مع أيقونة ونص اختياري
class GradientButton extends StatelessWidget {
  final List<Color> gradientColors;
  final IconData icon;
  final String? label;
  final VoidCallback onTap;
  final double size;

  const GradientButton({
    required this.gradientColors,
    required this.icon,
    this.label,
    required this.onTap,
    this.size = AppSizes.buttonSizeLarge,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Material(
        elevation: AppSizes.elevationLarge,
        shape: CircleBorder(),
        child: InkWell(
          customBorder: CircleBorder(),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: size * 0.25,
                  color: AppColors.white,
                ),
                if (label != null) ...[
                  SizedBox(height: AppSizes.paddingSmall),
                  Text(
                    label!,
                    style: TextStyle(
                      fontSize: size * 0.08,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}