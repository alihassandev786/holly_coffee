import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
class AddremoveButton extends StatelessWidget {
  final IconData icon;
  final bool filled;
  final VoidCallback onTap;
  const AddremoveButton({super.key, 
    required this.icon,
    required this.onTap,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: myPadding * 1.2,
        backgroundColor: filled ? AppColors.primary : theme.cardColor,
        child: Icon(
          icon,
          color: filled ? AppColors.bgcolor : AppColors.textcolor1,
        ),
      ),
    );
  }
}