import 'package:flutter/material.dart';
import 'package:hollycoffee/core/apptheme/appcolors.dart';
import 'package:hollycoffee/core/apptheme/apptheme.dart';
import 'package:hollycoffee/presentation/others/categorychipmodel.dart';
class Categorychip extends StatelessWidget {
  final Categorychipmodel category;

  const Categorychip({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
    );
  }
}
