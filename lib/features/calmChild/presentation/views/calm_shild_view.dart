import 'package:children_police/core/constants/colors.dart';
import 'package:children_police/core/constants/images.dart';
import 'package:children_police/core/constants/sizes.dart';
import 'package:children_police/core/widgets/bolice_bage.dart' show PoliceBadge;
import 'package:children_police/core/widgets/gradient_background.dart';
import 'package:children_police/core/widgets/styled_text.dart';
import 'package:children_police/features/calmChild/data/dialects.dart' show Dialects;
import 'package:children_police/features/calmChild/presentation/widgets/dailect_card.dart';
import 'package:children_police/features/start_calling/presentation/views/start_calling_view.dart';
import 'package:flutter/material.dart';

class CalmChildDialectsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // تصفية اللهجات الخاصة بالطفل الهادي
    final calmDialects = Map.fromEntries(
      Dialects.dialects.entries
          .where((entry) => entry.key.startsWith('calm'))
    );

    return Scaffold(
      body: GradientBackground(
        colors: [
         AppColors.green500,
          AppColors.greenLight100,
          AppColors.white,
        ],
        child: Column(
          children: [
            // Header with back button
            Container(
              padding: EdgeInsets.all(AppSizes.paddingExtraLarge),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.greenDark600,
                          size: AppSizes.iconMedium,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: PoliceBadge(
                            color: AppColors.greenDark600,
                            image: Assets.logo,
                          ),
                        ),
                      ),
                      SizedBox(width: AppSizes.iconMedium + 16),
                    ],
                  ),
                  SizedBox(height: AppSizes.paddingLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.child_care,
                        color: AppColors.greenDark600,
                        size: AppSizes.iconLarge,
                      ),
                      SizedBox(width: AppSizes.paddingMedium),
                      StyledText(
                        text: 'الطفل الهادي',
                        fontSize: AppSizes.fontTitle,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greenDark600,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.paddingSmall),
                  StyledText(
                    text: 'اختر اللهجة المناسبة',
                    fontSize: AppSizes.fontMedium,
                    color: AppColors.grey600,
                  ),
                ],
              ),
            ),
            
            // Dialects List
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingLarge),
                child: ListView.builder(
                  itemCount: calmDialects.length,
                  itemBuilder: (context, index) {
                    final entry = calmDialects.entries.elementAt(index);
                    final dialectData = entry.value;
                    
                    return DialectCard(
                      name: dialectData['name'],
                      icon: dialectData['icon'],
                      gradientColors: dialectData['gradient'],
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) =>
                                StartCallScreen(
                              dialect: entry.key,
                              label: dialectData['name'],
                              color: dialectData['color'],
                            ),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return SlideTransition(
                                position: animation.drive(
                                  Tween(begin: Offset(1.0, 0.0), end: Offset.zero),
                                ),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
