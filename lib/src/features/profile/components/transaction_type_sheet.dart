import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

enum TransactionType { topUp, withDraw, shareBalance }

class Transactiontypesheet extends StatefulWidget {
  const Transactiontypesheet({super.key});
  static Future<TransactionType?> show(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: AppColors.bgcolor,
      showDragHandle: false,
      shape: RoundedSuperellipseBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(myPadding * 1.2),
        ),
      ),
      context: context,
      builder: (_) => Transactiontypesheet(),
    );
  }

  @override
  State<Transactiontypesheet> createState() => _TransactiontypesheetState();
}

class _TransactiontypesheetState extends State<Transactiontypesheet> {
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
            "Transaction Type",
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600
            )
          ),
          SizedBox(height: myPadding / 1.5),
          Typetile(
            ontap: () {},
            icon: Icons.south_west,
            color: AppColors.success,
            title: "Top up",
          ),
          SizedBox(height: myPadding / 1.5),

          Typetile(
            ontap: () {},
            icon: Icons.north_east,
            color: AppColors.error,
            title: "With Draw",
          ),
          SizedBox(height: myPadding / 1.5),

          Typetile(
            ontap: () {},
            icon: Iconsax.arrow_swap,
            color: AppColors.textcolor2,
            title: "Share Balance",
          ),
          SizedBox(height: myPadding *1.2),
        ],
      ),
    );
  }
}

class Typetile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final VoidCallback ontap;
  const Typetile({
    super.key,
    required this.icon,
    required this.color,
    required this.ontap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: ontap,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadiusGeometry.circular(myPadding / 1),
          side: BorderSide(color: AppColors.border, width: myPadding / 16),
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: myPadding * .8,
            vertical: myPadding * .3,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
                 radius: myPadding * 1.4,
                 backgroundColor: theme.cardColor,
                 child: Icon(icon, color: color),
               ),
               title:  Text(
                 title,
                 style: theme.textTheme.titleLarge?.copyWith(
                   fontSize: myPadding * 1.09,
                   fontWeight: FontWeight.w500,
                 ),
               ),
          ),
        ),
      ),
    );
  }
}
