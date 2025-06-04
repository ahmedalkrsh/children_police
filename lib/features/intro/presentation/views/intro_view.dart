import 'package:children_police/features/calmChild/presentation/views/calm_shild_view.dart';
import 'package:children_police/features/intro/presentation/widgets/child_card.dart' show ChildTypeCard;
import 'package:flutter/material.dart';
import 'package:children_police/core/constants/colors.dart';
import 'package:children_police/core/constants/images.dart';
import 'package:children_police/core/constants/sizes.dart';
import 'package:children_police/core/widgets/bolice_bage.dart';
import 'package:children_police/core/widgets/gradient_background.dart';
import 'package:children_police/core/widgets/styled_text.dart';
import 'package:children_police/features/naughtyChild/presentation/views/naughty_child_view.dart';

class ChildTypeSelectionScreen extends StatelessWidget {
  
  const ChildTypeSelectionScreen({super.key}); // تم إضافة const

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: GradientBackground(
    colors: [
      AppColors.blueLight50 ,
      AppColors.blueLight100 ,
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
                ChildTypeCard(
                  
                  title: 'الطفل الهادي',
                  subtitle: '3 لهجات متاحة',
                  icon: Icons.child_care,
                  gradientColors: [
                    AppColors.greenLight400, 
                    AppColors.greenDark600 ,
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
                ChildTypeCard(
                
                  title: 'الطفل الشقي',
                  subtitle: '3 لهجات متاحة',
                  icon: Icons.child_friendly,
                  gradientColors: [
                    AppColors.orangeLight400 ,
                    AppColors.orangeDark600 ,
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

  
  
}