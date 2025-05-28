import 'package:children_police/core/constants/colors.dart';
import 'package:children_police/core/constants/sizes.dart';
import 'package:children_police/core/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class DialectCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  const DialectCard({
    required this.name,
    required this.icon,
    required this.gradientColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.paddingMedium),
      child: Material(
        elevation: AppSizes.elevationSmall,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(AppSizes.paddingMedium),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: AppSizes.badgeSize * 0.5,
                  height: AppSizes.badgeSize * 0.5,
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(AppSizes.badgeSize * 0.25),
                  ),
                  child: Icon(
                    icon,
                    size: AppSizes.iconSmall,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(width: AppSizes.paddingLarge),
                Expanded(
                  child: StyledText(
                    text: name,
                    fontSize: AppSizes.fontLarge,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                    textAlign: TextAlign.left,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.white.withOpacity(0.8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}