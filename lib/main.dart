import 'package:children_police/features/intro/presentation/views/intro_view.dart';
import 'package:flutter/material.dart';
import 'package:children_police/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    runApp(ChildPoliceApp());
  } catch (e, stack) {
    print('Main error: $e\n$stack');
}
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
