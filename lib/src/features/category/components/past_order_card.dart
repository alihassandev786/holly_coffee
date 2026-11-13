import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/category/models/order_model.dart';

class PastOrderCard extends StatelessWidget {
  final OrderModel order;
  const PastOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: myPadding * 7.5,
      width: double.infinity,
      child: Card(
        elevation: 0,
        color: theme.cardColor,

        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(myPadding * 1.5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: myPadding * .55,
            vertical: myPadding * .55,
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(myPadding * 1.2),
                    child: SizedBox(
                      height: double.infinity,
                      width: myPadding * 6.7,
                      child: Image.network(order.imageUrl, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: myPadding * .6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: myPadding * 12,
                        child: Text(
                          maxLines: 3,
                          order.title,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: myPadding * 1.2,
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        // sirf yahan chhoti condition hai
                        "${order.type == Ordertype.delivery ? "Delivery" : "Pickup"}  ·  ${order.itemscount} items",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "\$${order.price.toStringAsFixed(2)}",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: myPadding * 1.2,
                    color: AppColors.primary,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
