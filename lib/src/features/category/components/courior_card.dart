import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';

class courierinfo {
  final String name;
  final String vehicle;
  final String? imageUrl;
  const courierinfo({
    required this.imageUrl,
    required this.name,
    required this.vehicle,
  });
}

class courierCard extends StatelessWidget {
  final courierinfo courier;
  final VoidCallback? oncall;
  final VoidCallback? onchat;
  const courierCard({
    super.key,
    required this.courier,
    this.oncall,
    this.onchat,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fallback = ColoredBox(
      color: AppColors.border,
      child: Icon(Icons.percent, color: AppColors.textcolor2),
    );
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: myPadding*1.5,
        backgroundColor: AppColors.primary,
        child: CircleAvatar(
          radius: myPadding * 1.4,
          child: courier.imageUrl == null
              ? fallback
              : Image.network(
                  courier.imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => fallback,
                ),
        ),
      ),
      title: Text(
        courier.name,
        maxLines: 1,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: myPadding * 1.2,
        ),
      ),
      subtitle: Text(
        courier.vehicle,
        style: theme.textTheme.titleSmall?.copyWith(
          color: AppColors.textcolor2,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Roundedaction(icon: Icons.call, ontap: () {}),
          SizedBox(width: myPadding / 2),
          Roundedaction(icon: Icons.chat_bubble, ontap: () {}),
        ],
      ),
    );
  }
}

class Roundedaction extends StatelessWidget {
  final IconData icon;
  final VoidCallback ontap;
  const Roundedaction({super.key, required this.icon, required this.ontap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: CircleBorder(),
      color: theme.cardColor,
      child: SizedBox(
        height: myPadding * 3,
        width: myPadding * 3,
        child: Icon(icon, color: AppColors.primary, size: myPadding * 1.6),
      ),
    );
  }
}
