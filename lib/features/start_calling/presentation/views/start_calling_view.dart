import 'package:children_police/core/widgets/bolice_bage.dart';
import 'package:children_police/core/widgets/custom_appbar';
import 'package:flutter/material.dart';
import 'package:children_police/core/constants/colors.dart';
import 'package:children_police/core/constants/sizes.dart';
import 'package:children_police/core/widgets/gradient_background.dart';
import 'package:children_police/core/widgets/gradient_button.dart';
import 'package:children_police/core/widgets/styled_text.dart';
import 'package:children_police/features/calling/presentation/views/call_screen_view.dart';

class StartCallScreen extends StatelessWidget {
  final String dialect;
  final String label;
  final Color color;

  const StartCallScreen({
    required this.dialect,
    required this.label,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        colors: [
          color.withOpacity(0.1),
          AppColors.white,
        ],
        child: Column(
          children: [
            CustomAppBar(
              title: 'اللهجة: $label',
              titleColor: color,
              iconColor: color,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PoliceBadge(color: color),
                  SizedBox(height: AppSizes.paddingExtraLarge),
                  StyledText(
                    text: 'جاهز للاتصال',
                    fontSize: AppSizes.fontExtraLarge,
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey700,
                  ),
                  SizedBox(height: AppSizes.paddingMedium),
                  StyledText(
                    text: 'اضغط الزر لبدء مكالمة شرطة الأطفال',
                    fontSize: AppSizes.fontSmall,
                    color: AppColors.grey600,
                  ),
                  SizedBox(height: AppSizes.paddingExtraLarge * 2),
                  GradientButton(
                    gradientColors: [AppColors.greenLight400, AppColors.greenDark600],
                    icon: Icons.call,
                    label: 'ابدأ المكالمة',
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              CallScreen(dialect: dialect, color: color),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            return FadeTransition(opacity: animation, child: child);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}