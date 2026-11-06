import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/home/data/menu_data.dart';
class Menucategorytab extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategoryselected;
  const Menucategorytab({
    super.key,
    required this.selectedCategory,
    required this.onCategoryselected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: myPadding * 5,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: myPadding / 1.5),
        itemBuilder: (context, index) {
          final Category = Menudata.categories[index];
          final isSelected = selectedCategory == Category.id;
          return GestureDetector(
            onTap: () {
              onCategoryselected(Category.id);
            },
            child: Container(
              padding: EdgeInsets.only(
                left: myPadding / 2.7,
                bottom: myPadding / 2.7,
                top: myPadding / 2.7,
                right: myPadding / 1.5,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : theme.canvasColor,
                borderRadius: BorderRadius.circular(myPadding * 4),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: myPadding * 1.5,
                    backgroundColor: AppColors.bgcolor,
                    child: Image.network(
                      Category.image,
                      height: myPadding * 1.8,
                      width: myPadding * 1.8,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: myPadding * .4),
                  Text(
                    Category.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: isSelected
                          ? AppColors.bgcolor
                          : AppColors.textcolor1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: myPadding * .6);
        },
        itemCount: Menudata.categories.length,
      ),
    );
  }
}
