import 'package:flutter/material.dart';
import 'package:hollycoffee/core/apptheme/appcolors.dart';
import 'package:hollycoffee/core/apptheme/apptheme.dart';

class Rewardchip extends StatelessWidget {
  final IconData icon;
  final String title;
  const Rewardchip({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: AppColors.bgcolor,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(myPadding*.8),
        side: BorderSide(
          color: AppColors.primary,
          width: myPadding/12,
        )
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: myPadding * 1,
          vertical: myPadding * .8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primary),
            SizedBox(width: myPadding / 2),
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
