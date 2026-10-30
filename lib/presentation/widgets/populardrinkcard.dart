import 'package:flutter/material.dart';
import 'package:hollycoffee/core/apptheme/appcolors.dart';
import 'package:hollycoffee/core/apptheme/apptheme.dart';
import 'package:hollycoffee/presentation/others/populardrinkmodel.dart';
class Populardrinkcard extends StatelessWidget {
  final Populardrinkmodel categorycard;
  const Populardrinkcard({super.key,required this.categorycard});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
              Container(
                height: double.infinity,
                width: myPadding * 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(myPadding * 1.2),
                  image: DecorationImage(
                    image: NetworkImage(categorycard.image),
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
    );
  
  }
}