import 'package:children_police/core/constants/images.dart';
import 'package:children_police/core/widgets/animated_gradient_button.dart';
import 'package:children_police/features/girlsScreen/presentation/views/girls_view.dart';
import 'package:children_police/features/home/presentation/views/dialect_screen.dart' show DialectSelectionScreen;
import 'package:flutter/material.dart';
import 'package:children_police/core/constants/colors.dart';
import 'package:children_police/core/constants/sizes.dart';
import 'package:children_police/core/widgets/gradient_background.dart';
import 'package:children_police/core/widgets/styled_text.dart';

class GenderSelectionScreen extends StatelessWidget {
  const GenderSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        colors: [
          AppColors.blueDark900,
          AppColors.blueDark700,
          AppColors.blueDark600,
        ],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                
                // النص العلوي
                const StyledText(
                  text: 'اختر الشخصية',
                  fontSize: AppSizes.fontTitle,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
                
                const SizedBox(height: AppSizes.paddingMedium),
                
                // نص فرعي للتوضيح
                 StyledText(
                  text: 'اختر شخصيتك المفضلة للمتابعة',
                  fontSize: AppSizes.fontSmall,
                  color: AppColors.white,
                  fontWeight: FontWeight.w300,
                ),
                
                const Spacer(flex: 1),
                
                // صورة الشعار
                Container(
                  height: 180 ,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      Assets.background,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                const Spacer(flex: 2),
                
                // الأزرار (ولد / بنت)
                Row(
                  children: [
                    Expanded(
                      child: AnimatedGradientButton(
                        gradientColors: [AppColors.blueDark700, AppColors.blueDark900],
                        icon: Icons.boy,
                        label: 'ولد',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>  DialectSelectionScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    
                    const SizedBox(width: AppSizes.paddingMedium),
                    
                    Expanded(
                      child: AnimatedGradientButton(
                        gradientColors: [AppColors.redLight400, AppColors.redDark600],
                        icon: Icons.girl,
                        label: 'بنت',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>  GirlsScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                
                const Spacer(flex: 1),
                
                // نص صغير في الأسفل (اختياري)
                Text(
                  'يمكنك تغيير اختيارك لاحقاً من الإعدادات',
                  style: TextStyle(
                    color: AppColors.white.withOpacity(0.7),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: AppSizes.paddingMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}