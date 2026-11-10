import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/category/models/order_model.dart';
import 'package:hollycoffee/src/features/category/screens/order_detailscreen.dart';

class ActiveorderCard extends StatefulWidget {
  final OrderModel order;
  const ActiveorderCard({super.key, required this.order});

  @override
  State<ActiveorderCard> createState() => _ActiveorderCardState();
}

class _ActiveorderCardState extends State<ActiveorderCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isOnTheWay = widget.order.status == OrderStatus.ontheway;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(myPadding * 1),
      ),
      color: theme.primaryColor.withAlpha(40),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: myPadding / 1.3,
          vertical: myPadding / 1.3,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  child: Image.network(
                    widget.order.imageUrl,
                    height: myPadding * 6.2,
                    width: myPadding * 6.2,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: myPadding * 0.9),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: myPadding * 10.5,
                      child: Text(
                        maxLines: 2,
                        widget.order.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: myPadding * 1.2,
                        ),
                      ),
                    ),
                    SizedBox(height: myPadding * 1),

                    Text(
                      "${widget.order.type == Ordertype.delivery ? "Delivery" : "Pickup"} . ${widget.order.itemscount} items",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "\$${widget.order.price.toStringAsFixed(2)}",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: myPadding * 1.2,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: myPadding / 1.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isOnTheWay ? "On the way" : "Ready to pickup",
                  style: theme.textTheme.bodyLarge,
                ),
                if (isOnTheWay && widget.order.estimatedtime != null)
                  Text(
                    widget.order.estimatedtime!,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColors.textcolor1,
                    ),
                  ),
              ],
            ),
            SizedBox(height: myPadding / 3),
            ClipRRect(
              borderRadius: BorderRadius.circular(myPadding / 1.2),
              child: LinearProgressIndicator(
                value: isOnTheWay ? 0.7 : 1.0,
                minHeight: myPadding / 3,
                backgroundColor: AppColors.textcolor2.withAlpha(80),
                valueColor: AlwaysStoppedAnimation(AppColors.primary),
              ),
            ),
            SizedBox(height: myPadding * 1.1),
            SizedBox(
              height: myPadding * 3,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushNamed(OrderDetailscreen.route, arguments: widget.order);
                },
                child: Text(
                  isOnTheWay ? "Track Order" : "Get Direction",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: myPadding * 1.2,
                    fontWeight: FontWeight.w600,
                    color: AppColors.bgcolor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
