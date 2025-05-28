import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';
import 'styled_text.dart';

class EnhancedDialectCard extends StatefulWidget {
  final String name;
  final IconData icon;
  final List<Color> gradientColors;
  final VoidCallback onTap;
  final String? description;

  const EnhancedDialectCard({
    Key? key,
    required this.name,
    required this.icon,
    required this.gradientColors,
    required this.onTap,
    this.description,
  }) : super(key: key);

  @override
  State<EnhancedDialectCard> createState() => _EnhancedDialectCardState();
}

class _EnhancedDialectCardState extends State<EnhancedDialectCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(
          vertical: AppSizes.paddingMedium,
          horizontal: _isPressed ? AppSizes.paddingSmall : 0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: widget.gradientColors.first.withOpacity(_isPressed ? 0.2 : 0.4),
              blurRadius: _isPressed ? 10 : 15,
              spreadRadius: _isPressed ? 0 : 2,
              offset: _isPressed ? const Offset(0, 2) : const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onTap,
              splashColor: Colors.white.withOpacity(0.2),
              highlightColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.paddingLarge),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSizes.paddingMedium),
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        widget.icon,
                        size: AppSizes.iconLarge,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(width: AppSizes.paddingLarge),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StyledText(
                            text: widget.name,
                            fontSize: AppSizes.fontLarge,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                          if (widget.description != null) ...[
                            SizedBox(height: AppSizes.paddingSmall / 2),
                            StyledText(
                              text: widget.description!,
                              fontSize: AppSizes.fontSmall,
                              color: AppColors.white.withOpacity(0.9),
                            ),
                          ],
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.white,
                      size: AppSizes.iconSmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
