import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/home/models/category_chip_model.dart';


class Categorycard extends StatelessWidget {
  final Categorychipmodel category;
  final VoidCallback ontap;
  const Categorycard({super.key, required this.category,required this.ontap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedSuperellipseBorder(
        borderRadius: BorderRadius.circular(myPadding * 1),
      ),
      elevation: 0,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: ontap,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: myPadding/1.1,vertical: myPadding/1.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: myPadding * 2.9,
                backgroundColor: AppColors.bgcolor,
                child: Image.network(category.image,height: myPadding*3.5,width: myPadding*3,),
              ),
              SizedBox(height: myPadding / 1),
              Text(
                category.title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
