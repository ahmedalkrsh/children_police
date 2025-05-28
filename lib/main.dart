import 'package:children_police/features/calmChild/presentation/views/calm_shild_view.dart';
import 'package:children_police/features/intro/presentation/views/intro_view.dart';
import 'package:flutter/material.dart';
import 'package:children_police/core/constants/colors.dart';
import 'package:children_police/core/theme/app_theme.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  
  runApp(const ChildPoliceApp());
}

class ChildPoliceApp extends StatelessWidget {
  const ChildPoliceApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'شرطة الأطفال',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: ChildTypeSelectionScreen(),
    );
  }
}
