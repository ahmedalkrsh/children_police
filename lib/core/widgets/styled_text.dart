import 'package:flutter/material.dart';
import 'package:children_police/core/constants/sizes.dart';

// نص بنمط موحد
class StyledText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const StyledText({
    required this.text,
    this.fontSize = AppSizes.fontSmall,
    this.fontWeight = FontWeight.normal,
    required this.color,
    this.textAlign = TextAlign.center,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}