import 'package:children_police/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChildPoliceApp());
}

class ChildPoliceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'شرطة الأطفال',
      theme: ThemeData(
        primarySwatch: Colors.blue,
    
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 8, 
            shadowColor: Colors.black26,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: DialectSelectionScreen(),
    );
  }
}

