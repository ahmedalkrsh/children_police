import 'package:children_police/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:children_police/core/constants/sizes.dart';

// شعار الشرطة مع تأثيرات بصرية محسن
class PoliceBadge extends StatelessWidget {
  final Color color;
  final double? size;
  final String image;
  
  const PoliceBadge({
    required this.color,
    this.size,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // حساب الحجم المناسب للشاشة
    final screenWidth = MediaQuery.of(context).size.width;
    final adaptiveSize = size ?? (screenWidth * 0.35); // 25% من عرض الشاشة
    
    return Container(
      width: adaptiveSize * 1.5,
      height: adaptiveSize * 1.5,
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
          width: adaptiveSize,
          height: adaptiveSize,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: AppSizes.shadowBlurRadius,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              image,
              width: adaptiveSize,
              height: adaptiveSize,
              fit: BoxFit.cover, // عشان الصورة تملأ الدائرة كلها
            ),
          ),
        ),
      ),
    );
  }
}