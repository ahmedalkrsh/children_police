import 'package:flutter/material.dart';
import 'package:children_police/core/constants/sizes.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final Color? iconColor;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    this.title,
    this.titleColor,
    this.iconColor,
    this.onBackPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.paddingMedium),
      child: Row(
        children: [
          IconButton(
            onPressed: onBackPressed ?? () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: iconColor ?? Colors.black,
            ),
          ),
          if (title != null)
            Expanded(
              child: Text(
                title!,
                style: TextStyle(
                  fontSize: AppSizes.fontLarge,
                  fontWeight: FontWeight.bold,
                  color: titleColor ?? Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          if (title != null) SizedBox(width: AppSizes.paddingExtraLarge),
        ],
      ),
    );
  }
}