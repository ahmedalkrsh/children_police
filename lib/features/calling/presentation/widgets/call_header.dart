
import 'package:children_police/core/constants/colors.dart';
import 'package:children_police/core/constants/sizes.dart';
import 'package:children_police/core/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class CallHeader extends StatelessWidget {
  const CallHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.paddingLarge),
      child: Column(
        children: [
          StyledText(
            text: 'مكالمة جارية',
            fontSize: AppSizes.fontExtraLarge,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          SizedBox(height: AppSizes.paddingSmall),
          StyledText(
            text: 'شرطة الأطفال',
            fontSize: AppSizes.fontSmall,
            color: AppColors.white.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
