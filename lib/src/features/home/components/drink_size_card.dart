import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/home/models/product_model.dart';
class SizeCard extends StatelessWidget {
  final ProductSize size;
  final bool selected;
  const SizeCard({required this.size, required this.selected});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = selected ? AppColors.primary : AppColors.textcolor2;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: myPadding * 5.5,
      padding: EdgeInsets.symmetric(vertical: myPadding * .8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(myPadding * 1),
        border: Border.all(
          color: selected ? AppColors.primary : theme.cardColor,
          width: selected ? 1.5 : 1,
        ),
      ),
      child: Column(
        children: [
          Icon(size.icon, color: color, size: 30),
          SizedBox(height: myPadding / 4),
          Text(
            size.name,
            style: theme.textTheme.titleMedium?.copyWith(
              color: selected ? Colors.black : AppColors.textcolor2,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: myPadding / 4),
          Text(
            "\$ ${size.price.toStringAsFixed(2)}",
            style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.textcolor2),
          ),
        ],
      ),
    );
  }
}