import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';

class OrderStatusCard extends StatelessWidget {
  final String statustext;
  final String? estimatedtime;
  final Duration duration;
  final VoidCallback? onfinished;
  const OrderStatusCard({
    super.key,
    required this.statustext,
    this.onfinished,
    required this.estimatedtime,
     this.duration = const Duration(seconds: 10),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(myPadding / 1.5),
      ),
      color: theme.primaryColor.withAlpha(40),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: myPadding/1.5,vertical: myPadding/1.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order Status",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: myPadding*1.2
              ),
            ),
            SizedBox(height: myPadding * 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  statustext,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textcolor2,

                  ),
                ),
                if (estimatedtime != null)
                  Text(
                    estimatedtime!,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColors.textcolor1,
                    ),
                  ),
              ],
            ),
            SizedBox(height: myPadding / 3),
            ClipRRect(
              borderRadius: BorderRadius.circular(myPadding / 1.2),
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0,end: 1.0),
                duration: duration,
                curve: Curves.linear,
                onEnd: onfinished,
                builder:(_, value, _)=> LinearProgressIndicator(
                  value: value,
                  minHeight: myPadding / 3,
                  backgroundColor: AppColors.textcolor2.withAlpha(80),
                  valueColor: AlwaysStoppedAnimation(AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
