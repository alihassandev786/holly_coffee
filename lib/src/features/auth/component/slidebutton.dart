import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';

class Slidebutton extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  final Color color;
  const Slidebutton({
    super.key,
    required this.title,
    required this.ontap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Stack(
      children: [
        SizedBox(
          height: myPadding * 3.5,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: ontap,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(myPadding*1)
              )
            ),
            child: Text(
              title,
              style: text.titleLarge?.copyWith(color: AppColors.bgcolor),
            ),
          ),
        ),
        Positioned(
          right: myPadding * 0.4,
          top: myPadding * 0.4,
          bottom: myPadding * 0.4,
          child: SizedBox(
            height: myPadding * 4,
            width: myPadding * 2.9,
            child: Card(
              color: AppColors.bgcolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(myPadding * .8),
              ),
              elevation: 0,
              child: Icon(Icons.keyboard_double_arrow_right, color: color,size: myPadding*2,),
            ),
          ),
        ),
      ],
    );
  }
}
