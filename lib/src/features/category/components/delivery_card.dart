import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
class Deliverycard extends StatelessWidget {
  const Deliverycard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: myPadding / 4,
          vertical: myPadding / 4,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: myPadding * 2.5,
                backgroundColor: AppColors.primary.withAlpha(50),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Est Delivery",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColors.textcolor2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Standard (15 - 20 mins)",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: myPadding*1.25
                    ),
                  ),
                  Text(
                    "change",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: myPadding / 10,
              left: myPadding / 1.5,
              child: Image(
                image: AssetImage("assets/images/checkoutimage.png"),
                height: myPadding * 4.7,
                width: myPadding * 4.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}