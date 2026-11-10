import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';

class OrdertypeSheet extends StatefulWidget {
  final int initial;
  const OrdertypeSheet({super.key, this.initial = 0});
  static Future<int?> show(BuildContext context, {int initial = 0}) {
    return showModalBottomSheet(
      backgroundColor: AppColors.bgcolor,
      showDragHandle: false,
      shape: RoundedSuperellipseBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(myPadding * 1.2),
        ),
      ),
      context: context,
      builder: (_) => OrdertypeSheet(initial: initial),
    );
  }

  @override
  State<OrdertypeSheet> createState() => _OrdertypeSheetState();
}

class _OrdertypeSheetState extends State<OrdertypeSheet> {
  late int selectedtype = widget.initial;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: myPadding * 1,
        vertical: myPadding * 1.1,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Type",
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: myPadding / 1.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: OrderTypecard(
                  title: "Delivery",
                  time: "22-23 min",
                  ontap: () => setState(() {
                    selectedtype = 0;
                    Navigator.pop(context, 0);
                  }),
                  icon: Icons.local_shipping_outlined,
                  isSelected: selectedtype == 0,
                ),
              ),
              SizedBox(width: myPadding * 1.3),
              Expanded(
                child: OrderTypecard(
                  title: "Pick up",
                  time: "22-23 min",
                  ontap: () => setState(() {
                    selectedtype = 1;
                    Navigator.pop(context, 1);
                  }),
                  icon: Icons.storefront_outlined,
                  isSelected: selectedtype == 1,
                ),
              ),
            ],
          ),
          SizedBox(height: myPadding / 2),
        ],
      ),
    );
  }
}

class OrderTypecard extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final String title;
  final String time;
  final VoidCallback ontap;
  const OrderTypecard({
    super.key,
    required this.title,
    required this.time,
    required this.ontap,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: ontap,
      child: Card(
        elevation: 0,
        color: isSelected ? AppColors.primary.withAlpha(50) : AppColors.bgcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(myPadding * 1.4),
          side: BorderSide(
            color: isSelected ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: myPadding * 1.3,
            vertical: myPadding / 1.4,
          ),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: isSelected
                    ? AppColors.primary.withAlpha(60)
                    : theme.cardColor,
                radius: myPadding * 1.55,
                child: Icon(
                  icon,
                  size: myPadding * 1.5,
                  color: isSelected ? AppColors.primary : AppColors.textcolor2,
                ),
              ),
              SizedBox(height: myPadding / 2),
              Text(
                title,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isSelected ? AppColors.primary : AppColors.textcolor1,
                ),
              ),
              SizedBox(height: myPadding / 2),
              Text(time, style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
