import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/config/constants/app_images.dart';
import 'package:hollycoffee/config/constants/app_string.dart';
import 'package:hollycoffee/src/features/category/components/courior_card.dart';
import 'package:hollycoffee/src/features/category/components/order_item_tile.dart';
import 'package:hollycoffee/src/features/category/components/order_map_view.dart';
import 'package:hollycoffee/src/features/category/components/order_status_card.dart';
import 'package:hollycoffee/src/features/category/components/topictitle.dart';
import 'package:hollycoffee/src/features/category/models/order_model.dart';

class OrderDetailscreen extends StatefulWidget {
  static const route = "/orderdetail";
  final OrderModel? order;
  const OrderDetailscreen({super.key, this.order});
  static const courier = courierinfo(
    imageUrl: Appimages.profileimage,
    name: "Alexender Philips",
    vehicle: "Motor bike",
  );

  @override
  State<OrderDetailscreen> createState() => _OrderDetailscreenState();
}

class _OrderDetailscreenState extends State<OrderDetailscreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final o =
        widget.order ??
        (ModalRoute.of(context)?.settings.arguments as OrderModel?);

    if (o == null) {
      return const Scaffold(body: Center(child: Text("Order not found")));
    }
    final istracking = o.status == OrderStatus.ontheway;
    final iscompleted = o.status == OrderStatus.completed;
    final statustext = switch (o.status) {
      OrderStatus.ontheway => "On the way",
      OrderStatus.completed => "Completed",
      OrderStatus.readytopickup => "Ready to Pickup",
    };
    final subtotal = o.price * o.itemscount;
    const discount = 0.0;
    final total = subtotal - discount;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            floating: true,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            titleSpacing: myPadding / 10,
            title: Text(Appstring.orderdetail),
          ),
          SliverToBoxAdapter(child: Divider(color: AppColors.border)),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 2)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
            sliver: SliverToBoxAdapter(
              child: OrderStatusCard(
                statustext: statustext,
                progress: istracking ? 0.7 : 1.0,
                estimatedtime: istracking ? "Est 2 mins" : null,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 1.2)),
          SliverToBoxAdapter(child: Divider(color: AppColors.border)),
          if (!iscompleted) ...[
            SliverToBoxAdapter(child: SizedBox(height: myPadding / 2)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
              sliver: SliverToBoxAdapter(
                child: Topictitle(
                  title: istracking ? "Track your order" : "Direction",
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding / 1.5)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
              sliver: SliverToBoxAdapter(
                child: OrderMapView(
                  mode: istracking
                      ? OrderMapmode.tracking
                      : OrderMapmode.direction,
                  eatalable: "21 min",
                  progress: istracking ? 0.6 : 0.5,
                  courier: istracking
                      ? courierinfo(
                          imageUrl: Appimages.profileimage,
                          name: "Alexender Philips",
                          vehicle: "Motor Bike",
                        )
                      : null,
                  onCall: () {},
                  onChat: () {},
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding * .8)),
            SliverToBoxAdapter(child: Divider(color: AppColors.border)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
              sliver: SliverToBoxAdapter(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Items",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Text(
                    "${o.itemscount} items",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColors.textcolor2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
              sliver: SliverList.separated(
                itemCount: o.itemscount,
                itemBuilder: (_, __) => OrderItemTile(
                  imageUrl: o.imageUrl,
                  title: o.title,
                  subtitle: "Matcha . QTY : 1 item",
                  price: o.price,
                ),
                separatorBuilder: (_, __) => SizedBox(height: myPadding / 3),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding / 3)),
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
                    SizedBox(height: myPadding / 1.5),
                    SummaryTile(
                      title: "Discount",
                      amount: discount.toStringAsFixed(2),
                    ),
                    SizedBox(height: myPadding / 1.5),
                    SummaryTile(
                      title: "Total",
                      amount: "\$ ${total.toStringAsFixed(2)}",
                      istotal: true,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding * 5)),
          ],
        ],
      ),
    );
  }
}
