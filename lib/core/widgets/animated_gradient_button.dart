import 'package:flutter/material.dart';
import 'package:children_police/core/constants/colors.dart';
import 'package:children_police/core/constants/sizes.dart';

class AnimatedGradientButton extends StatefulWidget {
  final List<Color> gradientColors;
  final IconData icon;
  final String? label;
  final VoidCallback onTap;
  final double size;

  const AnimatedGradientButton({
    required this.gradientColors,
    required this.icon,
    this.label,
    required this.onTap,
    this.size = AppSizes.buttonSizeLarge,
    super.key,
  });

  @override
  State<AnimatedGradientButton> createState() => _AnimatedGradientButtonState();
}

class _AnimatedGradientButtonState extends State<AnimatedGradientButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.2), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward(); // تعمل مرّة واحدة
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        width: widget.size,
        height: widget.size,
        child: Material(
          elevation: AppSizes.elevationLarge,
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: widget.onTap,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: widget.gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    size: widget.size * 0.25,
                    color: AppColors.white,
                  ),
                  if (widget.label != null) ...[
                    const SizedBox(height: AppSizes.paddingSmall),
                    Text(
                      widget.label!,
                      style: TextStyle(
                        fontSize: widget.size * 0.08,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
