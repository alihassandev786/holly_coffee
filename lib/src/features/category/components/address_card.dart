import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/category/components/order_map_view.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(myPadding * .9),
      ),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(myPadding / 1.2),
        child: Column(
          children: [
            OrderMapView(
              mode: OrderMapmode.direction,
              eatalable: "19 min",
              progress: 0.5,
              height: myPadding * 11,
              showborder: false,
              pinscale: 0.65,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Padding(
                padding: EdgeInsets.only(bottom: myPadding * 1),
                child: Icon(
                  Icons.location_on_outlined,
                  size: myPadding * 1.5,
                  color: theme.primaryColor,
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deliver To",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: myPadding / 3),
                  Text(
                    "6391 Elgin St. Celina, Delaware 10299",
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: AppColors.textcolor2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
