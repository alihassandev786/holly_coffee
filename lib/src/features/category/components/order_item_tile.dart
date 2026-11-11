import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';

class OrderItemTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final double price;
  const OrderItemTile({
    super.key,
    required this.imageUrl,
    required this.price,
    required this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(myPadding / 2),
        child: Image.network(
          imageUrl,
          height: myPadding * 4,
          width: myPadding * 3.6,
          fit: BoxFit.cover,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: myPadding*1.05
            ),
          ),
          SizedBox(height: myPadding / 3),
          Text(
            subtitle,
            style: theme.textTheme.titleSmall?.copyWith(
              color: AppColors.textcolor2,
              fontSize: myPadding/1.1
            ),
          ),
        ],
      ),
      trailing: Padding(
        padding: EdgeInsets.only(top: myPadding * 1.7),
        child: Text(
          "\$ ${price.toStringAsFixed(2)}",
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.textcolor1,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}


class SummaryTile extends StatelessWidget {
  final String title;
  final String amount;
  final bool istotal;
  const SummaryTile({
    super.key,
    required this.title,
    required this.amount,
    this.istotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: myPadding * 2,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: istotal ? AppColors.textcolor1 : AppColors.textcolor2,
            fontSize: istotal ? myPadding * 1.4 : myPadding * 1.2,
          ),
        ),
        trailing: Text(
          amount,
          style: theme.textTheme.titleLarge?.copyWith(
            color: istotal ? AppColors.primary : AppColors.textcolor1,
            fontSize: istotal ? myPadding * 1.4 : myPadding * 1.2,
            fontWeight: istotal ? FontWeight.w600:FontWeight.w500

          ),
        ),
      ),
    );
  }
}