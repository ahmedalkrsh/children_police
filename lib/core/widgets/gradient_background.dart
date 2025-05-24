import 'package:flutter/material.dart';

// خلفية متدرجة قابلة للتخصيص
class GradientBackground extends StatelessWidget {
  final List<Color> colors;
  final Alignment begin;
  final Alignment end;
  final Widget child;

  const GradientBackground({
    required this.colors,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: colors,
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}