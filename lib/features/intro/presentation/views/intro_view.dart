import 'package:children_police/features/calmChild/presentation/views/calm_shild_view.dart';
import 'package:flutter/material.dart';
import 'package:children_police/core/constants/colors.dart';
import 'package:children_police/core/constants/images.dart';
import 'package:children_police/core/constants/sizes.dart';
import 'package:children_police/core/widgets/bolice_bage.dart';
import 'package:children_police/core/widgets/gradient_background.dart';
import 'package:children_police/core/widgets/styled_text.dart';
import 'package:children_police/features/naughtyChild/presentation/views/naughty_child_view.dart';

class ChildTypeSelectionScreen extends StatelessWidget {
  static const routeName = '/child-type-selection';
  
  const ChildTypeSelectionScreen({super.key}); // تم إضافة const

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: GradientBackground(
    colors: [
      AppColors.blueLight50 ?? Colors.blue.shade50,
      AppColors.blueLight100 ?? Colors.blue.shade100,
      AppColors.white,
    ],
    child: SingleChildScrollView(
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(AppSizes.paddingExtraLarge),
            child: Column(
              children: [
                PoliceBadge(
                  color: AppColors.blueDark600,
                  image: Assets.logo,
                ),
                SizedBox(height: AppSizes.paddingLarge),
                StyledText(
                  text: 'شرطة الأطفال',
                  fontSize: AppSizes.fontTitle,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueDark800,
                ),
                SizedBox(height: AppSizes.paddingSmall),
                StyledText(
                  text: 'اختر نوع الطفل',
                  fontSize: AppSizes.fontMedium,
                  color: AppColors.grey600,
                ),
              ],
            ),
          ),
          
          // Child Type Cards
          Padding(
            padding: EdgeInsets.all(AppSizes.paddingLarge),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // الطفل الهادي
                _buildChildTypeCard(
                  context,
                  title: 'الطفل الهادي',
                  subtitle: '3 لهجات متاحة',
                  icon: Icons.child_care,
                  gradientColors: [
                    AppColors.greenLight400 ?? Colors.green.shade400,
                    AppColors.greenDark600 ?? Colors.green.shade600,
                  ],
                  onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                           CalmChildDialectsScreen(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position: animation.drive(
                            Tween(begin: const Offset(1.0, 0.0), end: Offset.zero),
                          ),
                          child: child,
                        );
                      },
                    ),
                  ),
                ),
                
                SizedBox(height: AppSizes.paddingLarge),
                
                // الطفل الشقي
                _buildChildTypeCard(
                  context,
                  title: 'الطفل الشقي',
                  subtitle: '3 لهجات متاحة',
                  icon: Icons.child_friendly,
                  gradientColors: [
                    AppColors.orangeLight400 ?? Colors.orange.shade400,
                    AppColors.orangeDark600 ?? Colors.orange.shade600,
                  ],
                  onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const NaughtyChildDialectsScreen(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position: animation.drive(
                            Tween(begin: const Offset(1.0, 0.0), end: Offset.zero),
                          ),
                          child: child,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
  );
  }

  
  Widget _buildChildTypeCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required List<Color> gradientColors,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(AppSizes.paddingExtraLarge),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: gradientColors.isNotEmpty 
                  ? gradientColors.first.withOpacity(0.3)
                  : Colors.grey.withOpacity(0.3), // تم إضافة فحص للـ empty list
              blurRadius: 15,
              offset: const Offset(0, 8), // تم إضافة const
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(AppSizes.paddingLarge),
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: AppSizes.iconExtraLarge,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: AppSizes.paddingLarge),
            StyledText(
              text: title,
              fontSize: AppSizes.fontLarge,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
            SizedBox(height: AppSizes.paddingSmall),
            StyledText(
              text: subtitle,
              fontSize: AppSizes.fontMedium,
              color: AppColors.white.withOpacity(0.9),
            ),
          ],
        ),
      ),
    );
  }
}