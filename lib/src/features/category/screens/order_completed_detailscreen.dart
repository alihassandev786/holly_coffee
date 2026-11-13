import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/constants/app_string.dart';
import 'package:hollycoffee/src/features/category/components/info_row.dart';
import 'package:hollycoffee/src/features/category/components/order_item_tile.dart';
import 'package:hollycoffee/src/features/category/components/topictitle.dart';
import 'package:hollycoffee/src/features/category/models/order_model.dart';

class OrderCompletedDetailscreen extends StatefulWidget {
  static const route = "/ordercompleted";
  final OrderModel? order;
  const OrderCompletedDetailscreen({super.key, this.order});
  static const double deliveryfee = 6.00;

  @override
  State<OrderCompletedDetailscreen> createState() =>
      _OrderCompletedDetailscreenState();
}

class _OrderCompletedDetailscreenState
    extends State<OrderCompletedDetailscreen> {
  String formatdate(DateTime d) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    final hour = d.hour % 12 == 0 ? 12 : d.hour % 12;
    final minute = d.minute.toString().padLeft(2, "0");
    final ampm = d.hour >= 12 ? "PM" : "AM";
    return "${months[d.month - 1]} ${d.day}, ${d.year} at $hour:$minute $ampm";
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final o =
        widget.order ??
        (ModalRoute.of(context)?.settings.arguments as OrderModel?);
    if (o == null) {
      return Scaffold(body: Center(child: Text("Order not found")));
    }
    final isdelivery = o.type == Ordertype.delivery;
    final subtotal = o.price * o.itemscount;
    final fee = isdelivery ? OrderCompletedDetailscreen.deliveryfee : 0.0;
    const discount = 0.0;
    final total = subtotal + fee - discount;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            floating: true,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            titleSpacing: myPadding / 10,
            title: Text(Appstring.orderdetails),
          ),
          SliverToBoxAdapter(child: Divider(color: AppColors.border)),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 2)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order ID #${o.ordercode ?? "87456AB"}",
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w900,
                      fontSize: myPadding * 1.2,
                    ),
                  ),
                  InfoRow(
                    lable: "Placed On",
                    value: formatdate(
                      o.placedon ?? DateTime(2025, 9, 24, 19, 30),
                    ),
                  ),
                  InfoRow(
                    lable: "OrderType",
                    value: isdelivery ? "Delivery" : "Pickup",
                  ),
                  InfoRow(
                    lable: "Status",
                    valuewidget: StatusChip(lable: "Completed"),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 3)),
          SliverToBoxAdapter(child: Divider(color: AppColors.border)),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 4)),

          if (isdelivery) ...[
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Topictitle(title: "Delivery info"),
                    Addressinfotile(
                      address:
                          o.fromaddress ??
                          "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                      title: "Deliver From",
                    ),
                    Addressinfotile(
                      address:
                          o.toaddress ??
                          "6391 Elgin St. Celina, Delaware 10299",
                      title: "Deliver To",
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding / 4)),
            SliverToBoxAdapter(child: Divider(color: AppColors.border)),
          ],
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),

            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: myPadding * 3,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Topictitle(title: "Items"),
                  trailing: Text(
                    "${o.itemscount} items",
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppColors.textcolor2,
                      fontSize: myPadding / .95,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
            sliver: SliverList.separated(
              itemCount: o.itemscount,
              itemBuilder: (_, _) => OrderItemTile(
                imageUrl: o.imageUrl,
                price: o.price,
                subtitle: "Matcha . QTY : 1 item",
                title: o.title,
              ),
              separatorBuilder: (_, _) => SizedBox(height: myPadding / 3),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 2)),
          SliverToBoxAdapter(child: Divider(color: AppColors.border)),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 2)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Topictitle(title: "Order Summary"),
                  SummaryTile(
                    title: "Sub-total",
                    amount: "\$${subtotal.toStringAsFixed(2)}",
                  ),
                  if (isdelivery) ...[
                    SizedBox(height: myPadding / 1.5),

                    SummaryTile(
                      title: "Delivery Fee",
                      amount: "\$${fee.toStringAsFixed(2)}",
                    ),
                  ],
                  SizedBox(height: myPadding / 1.5),

                  SummaryTile(
                    title: "Discount",
                    amount: discount.toStringAsFixed(2),
                  ),
                  SizedBox(height: myPadding / 1.5),

                  SummaryTile(
                    title: "Total",
                    amount: "\$${total.toStringAsFixed(2)}",
                    istotal: true,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding * 3)),
        ],
      ),
    );
  }
}
