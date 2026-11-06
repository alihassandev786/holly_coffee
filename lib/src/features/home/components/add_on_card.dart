import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/home/models/product_model.dart';

class AddOnTile extends StatelessWidget {
  final ProductAddon addOn;
  final bool selected;
  final VoidCallback onTap;
  const AddOnTile({
    super.key,
    required this.addOn,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: myPadding*.9,vertical: myPadding/3.5),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              selected ? Icons.check_box : Icons.check_box_outline_blank,
              color: selected ? AppColors.primary : AppColors.border,
            ),
            title: Text(
              addOn.name,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: myPadding * 1.05,
              ),
            ),
            trailing: 
            Text(
                 "+${addOn.price.toStringAsFixed(2)}",
                 style: theme.textTheme.bodyLarge?.copyWith(
                   color: selected ? AppColors.primary : AppColors.textcolor2,
                   fontWeight: FontWeight.w600
                 ),
               ),      
          ),
        ),
      ),
    );
  }
}
