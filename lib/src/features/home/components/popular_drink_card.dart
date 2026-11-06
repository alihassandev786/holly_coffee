import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/home/data/menu_data.dart';
import 'package:hollycoffee/src/features/home/models/popular_drink_model.dart';
import 'package:hollycoffee/src/features/home/models/product_model.dart';
import 'package:hollycoffee/src/features/home/screens/product_detailscreen.dart';

class Populardrinkcard extends StatelessWidget {
  final Populardrinkmodel categorycard;
  const Populardrinkcard({super.key, required this.categorycard});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          Productdetail.route,
          arguments: Menudata.toProduct(categorycard),
        );
      },
      child: Container(
        height: myPadding * 8,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: myPadding * .55,
          vertical: myPadding * .55,
        ),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(myPadding * 1.2),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Hero(
                  tag: productHeroTag(categorycard.id),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(myPadding * 1.2),
                    child: SizedBox(
                      height: double.infinity,
                      width: myPadding * 7,
                      child: Image.network(
                        categorycard.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: myPadding * .6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: myPadding * 12,
                      child: Text(
                        maxLines: 3,
                        categorycard.name,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: myPadding * 1.05,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$ ${categorycard.price.toStringAsFixed(2)}",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: myPadding * 2.8,
                width: myPadding * 2.8,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, color: AppColors.bgcolor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
