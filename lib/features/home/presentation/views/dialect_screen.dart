import 'package:children_police/core/constants/images.dart';
import 'package:children_police/core/widgets/bolice_bage.dart';
import 'package:children_police/features/home/data/dialects.dart' show Dialects;
import 'package:children_police/features/home/presentation/widgets/dailect_card.dart';
import 'package:flutter/material.dart';
import 'package:children_police/core/constants/colors.dart';
import 'package:children_police/core/constants/sizes.dart';
import 'package:children_police/core/widgets/gradient_background.dart';
import 'package:children_police/core/widgets/styled_text.dart';
import 'package:children_police/features/start_calling/presentation/views/start_calling_view.dart';

class DialectSelectionScreen extends StatelessWidget {
  static const routeName = '/dialect-selection';

     DialectSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        colors: [
          AppColors.blueLight50,
          AppColors.blueLight100,
          AppColors.white,
        ],
        child: Column(
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.all(AppSizes.paddingExtraLarge),
              child: Column(
                children: [
                  PoliceBadge(
                    color: AppColors.blueDark600, image: Assets.logo ,
                   
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
                  itemCount: Dialects.dialects.length,
                  itemBuilder: (context, index) {
                    final entry = Dialects.dialects.entries.elementAt(index);
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

