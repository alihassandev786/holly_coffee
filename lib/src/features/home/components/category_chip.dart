import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/home/models/category_chip_model.dart';
class Categorychip extends StatelessWidget {
  final Categorychipmodel category;
  final VoidCallback ontap;

  const Categorychip({super.key, required this.category,required this.ontap});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(myPadding * .3),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(myPadding * 2),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(myPadding * .5),
              decoration: BoxDecoration(
                color: AppColors.bgcolor,
                shape: BoxShape.circle,
              ),
              child: Image.network(
                category.image,
                height: myPadding * 2.2,
                width: myPadding * 2.3,
              ),
            ),
            SizedBox(width: myPadding * .4),
            Expanded(
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                category.title,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
