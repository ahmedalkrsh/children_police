import 'package:flutter/material.dart';
import 'package:children_police/core/constants/colors.dart';
import 'package:children_police/core/constants/images.dart';
import 'package:children_police/core/constants/sizes.dart';
import 'package:children_police/core/widgets/bolice_bage.dart' show PoliceBadge;
import 'package:children_police/core/widgets/gradient_background.dart';
import 'package:children_police/core/widgets/styled_text.dart';
import 'package:children_police/features/calmChild/data/dialects.dart' show Dialects; // نفس ملف الـ dialects
import 'package:children_police/features/calmChild/presentation/widgets/dailect_card.dart';
import 'package:children_police/features/start_calling/presentation/views/start_calling_view.dart';

class NaughtyChildDialectsScreen extends StatelessWidget {
  const NaughtyChildDialectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // تصفية اللهجات الخاصة بالطفل الشقي
    final naughtyDialects = Map.fromEntries(
      Dialects.dialects.entries
          .where((entry) => entry.key.startsWith('naughty'))
    );

    return Scaffold(
      body: GradientBackground(
        colors: [
          AppColors.orangeLight50 ?? Colors.orange.shade50,
          AppColors.orangeLight100 ?? Colors.orange.shade100,
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
                          color: AppColors.orangeDark600 ?? Colors.orange.shade600,
                          size: AppSizes.iconMedium,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: PoliceBadge(
                            color: AppColors.orangeDark600 ?? Colors.orange.shade600,
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
                        Icons.child_friendly,
                        color: AppColors.orangeDark600 ?? Colors.orange.shade600,
                        size: AppSizes.iconLarge,
                      ),
                      SizedBox(width: AppSizes.paddingMedium),
                      StyledText(
                        text: 'الطفل الشقي',
                        fontSize: AppSizes.fontTitle,
                        fontWeight: FontWeight.bold,
                        color: AppColors.orangeDark600 ?? Colors.orange.shade600,
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
                child: naughtyDialects.isEmpty 
                    ? Center(
                        child: StyledText(
                          text: 'لا توجد لهجات متاحة',
                          fontSize: AppSizes.fontMedium,
                          color: AppColors.grey600,
                        ),
                      )
                    : ListView.builder(
                        itemCount: naughtyDialects.length,
                        itemBuilder: (context, index) {
                          final entry = naughtyDialects.entries.elementAt(index);
                          final dialectData = entry.value;
                          
                          return DialectCard(
                            name: dialectData['name'] ?? 'Unknown',
                            icon: dialectData['icon'] ?? Icons.help,
                            gradientColors: dialectData['gradient'] ?? [Colors.grey, Colors.grey.shade600],
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) =>
                                      StartCallScreen(
                                    dialect: entry.key,
                                    label: dialectData['name'] ?? 'Unknown',
                                    color: dialectData['color'] ?? Colors.grey,
                                  ),
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    return SlideTransition(
                                      position: animation.drive(
                                        Tween(begin: const Offset(1.0, 0.0), end: Offset.zero),
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