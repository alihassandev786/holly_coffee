import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';

class InfoRow extends StatelessWidget {
  final String lable;
  final String? value;
  final Widget? valuewidget;
  const InfoRow({super.key, required this.lable, this.value, this.valuewidget});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: myPadding*2.8,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          lable,
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.textcolor1,
            fontWeight: FontWeight.w600,
            fontSize: myPadding*1.05
          ),
        ),
        trailing: Text(
          value ?? "",
          textAlign: TextAlign.end,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.textcolor2,
            fontSize: myPadding/.95
          ),
        ),
      ),
    );
  }
}

class StatusChip extends StatelessWidget {
  final String lable;
  const StatusChip({super.key, required this.lable});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: StadiumBorder(),
      color: AppColors.success.withAlpha(40),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: myPadding * 1.2,
          vertical: myPadding / 2,
        ),
        child: Text(
          lable,
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.success,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Addressinfotile extends StatelessWidget {
  final String title;
  final String address;
  const Addressinfotile({
    super.key,
    required this.address,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Padding(
        padding:  EdgeInsets.only(bottom: myPadding*1),
        child: Icon(
          Icons.location_on_outlined,
          color: AppColors.primary,
          size: myPadding * 1.5,
        ),
      ),
      title: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          color: AppColors.textcolor1,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Padding(
        padding: EdgeInsetsGeometry.only(top: myPadding/2),
        child: Text(
          address,
          style: theme.textTheme.titleSmall?.copyWith(
            color: AppColors.textcolor2,fontSize: myPadding*.9
          ),
        ),
      ),
    );
  }
}
