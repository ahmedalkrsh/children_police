import 'package:children_police/core/constants/colors.dart';
import 'package:children_police/core/constants/images.dart';
import 'package:children_police/core/constants/sizes.dart';
import 'package:children_police/core/widgets/bolice_bage.dart';
import 'package:children_police/core/widgets/custom_appbar' show CustomAppBar;
import 'package:children_police/core/widgets/gradient_background.dart';
import 'package:children_police/core/widgets/gradient_button.dart';
import 'package:children_police/core/widgets/styled_text.dart';
import 'package:children_police/features/calling/presentation/views/call_screen_view.dart' show CallScreen;
import 'package:flutter/material.dart';

class GirlsScreen extends StatelessWidget {
  const GirlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        colors: [
          Colors.purple.withOpacity(0.1),
          AppColors.white,
        ],
        child: Column(
          children: [
            const CustomAppBar(
              title: 'صفحة البنات',
              titleColor: Colors.purple,
              iconColor: Colors.purple,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PoliceBadge(
                    color: Colors.purple,
                    image: Assets.logo,
                  ),
                  SizedBox(height: AppSizes.paddingExtraLarge),
                  StyledText(
                    text: 'مرحباً بالبنات',
                    fontSize: AppSizes.fontExtraLarge,
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey700,
                  ),
                  SizedBox(height: AppSizes.paddingMedium),
                  StyledText(
                    text: 'اضغطي الزر لبدء مكالمة شرطة الأطفال',
                    fontSize: AppSizes.fontSmall,
                    color: AppColors.grey600,
                  ),
                  SizedBox(height: AppSizes.paddingExtraLarge * 2),
                  
                  // Girls specific call button
                  GradientButton(
                    gradientColors: [
                      Colors.purple.withOpacity(0.7),
                      Colors.purple,
                    ],
                    icon: Icons.call,
                    label: 'ابدئي المكالمة',
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation ) =>
                              CallScreen(dialect: 'girls', color: Colors.purple),
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