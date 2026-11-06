import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/profile/models/transactionmodel.dart';
class Transactiontile extends StatelessWidget {
  final Transactionmodel item;
  const Transactiontile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: myPadding * 1.6,
        backgroundColor: theme.cardColor,
        child: Icon(
          item.isIncoming ? Icons.south_west : Icons.north_east,
          color: item.isIncoming ? AppColors.success : AppColors.error,
        ),
      ),
      title: Text(
        item.title,
        style: theme.textTheme.titleLarge?.copyWith(fontSize: myPadding * 1.15,fontWeight: FontWeight.w600),
      ),
      subtitle: Text(item.date, style: theme.textTheme.bodyMedium),
      trailing: Padding(
        padding:  EdgeInsets.only(top: myPadding*1),
        child: Text(
          "\$ ${item.amount.toStringAsFixed(2)}",
          style: theme.textTheme.titleLarge?.copyWith(
            color: item.isIncoming ? AppColors.success : AppColors.error,
            fontSize: myPadding*1.15
          ),
        ),
      ),
    );
  }
}
