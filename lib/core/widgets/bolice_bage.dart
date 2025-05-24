import 'package:children_police/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:children_police/core/constants/sizes.dart';

// شعار الشرطة مع تأثيرات بصرية
class PoliceBadge extends StatelessWidget {
  final Color color;
  final double size;
  final IconData icon;

  const PoliceBadge({
    required this.color,
    this.size = AppSizes.badgeSize,
    this.icon = Icons.local_police,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 1.67,
      height: size * 1.67,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withOpacity(0.2),
            color.withOpacity(0.1),
            Colors.transparent,
          ],
        ),
      ),
      child: Center(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: AppSizes.shadowBlurRadius,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Icon(
            icon,
            size: size * 0.5,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}