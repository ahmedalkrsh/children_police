import 'package:children_police/features/home/presentation/views/dialect_screen.dart';
import 'package:flutter/material.dart';
import 'package:children_police/core/constants/colors.dart';

void main() {
  runApp(const ChildPoliceApp());
}

class ChildPoliceApp extends StatelessWidget {
  const ChildPoliceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'شرطة الأطفال',
      theme: ThemeData(
        primarySwatch: AppColors.primaryBlue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 8,
            shadowColor: AppColors.black26,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home:  DialectSelectionScreen(),
    );
  }
}