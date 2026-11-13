import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/constants/app_images.dart';
import 'package:hollycoffee/src/constants/app_string.dart';
import 'package:hollycoffee/src/features/category/components/activeorder_card.dart';
import 'package:hollycoffee/src/features/category/components/past_order_card.dart';
import 'package:hollycoffee/src/features/category/components/topictitle.dart';
import 'package:hollycoffee/src/features/category/models/order_model.dart';

class DeliveryOrderscreen extends StatefulWidget {
  static const route = "/deliveryorder";
  final Ordertype type;
  DeliveryOrderscreen({super.key, required this.type});
  final List<OrderModel> orders = [
    OrderModel(
      title: "Cold Brew of the Saints",
      id: "1",
      price: 4.99,
      itemscount: 3,
      type: Ordertype.delivery,
      status: OrderStatus.completed,
      imageUrl: Appimages.categorycard,
    ),
    OrderModel(
      title: "Cold Brew of the Saints",
      id: "2",
      price: 4.99,
      itemscount: 3,
      type: Ordertype.delivery,
      status: OrderStatus.ontheway,
      estimatedtime: "Est 2 min",

      imageUrl: Appimages.categorycard,
    ),
    OrderModel(
      title: "Cold Brew of the Saints",
      id: "3",
      price: 4.99,
      itemscount: 3,
      type: Ordertype.delivery,
      status: OrderStatus.completed,
      imageUrl: Appimages.categorycard,
    ),
    OrderModel(
      title: "Cold Brew of the Saints",
      id: "4",
      price: 3.00,
      itemscount: 2,
      type: Ordertype.pickup,
      status: OrderStatus.readytopickup,
      imageUrl: Appimages.categorycard,
    ),
    OrderModel(
      title: "Cold Brew of the Saints",
      id: "5",
      price: 3.00,
      itemscount: 2,
      type: Ordertype.pickup,
      status: OrderStatus.completed,
      imageUrl: Appimages.categorycard,
    ),
    OrderModel(
      title: "Cold Brew of the Saints",
      id: "5",
      price: 3.00,
      itemscount: 2,
      type: Ordertype.pickup,
      status: OrderStatus.completed,
      imageUrl: Appimages.categorycard,
    ),
  ];

  @override
  State<DeliveryOrderscreen> createState() => _DeliveryOrderscreenState();
}

class _DeliveryOrderscreenState extends State<DeliveryOrderscreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typeOrders = widget.orders
        .where((o) => o.type == widget.type)
        .toList();

    final activeorders = typeOrders
        .where((o) => o.status != OrderStatus.completed)
        .toList();
    final pastorders = typeOrders
        .where((o) => o.status == OrderStatus.completed)
        .toList();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            floating: true,
            backgroundColor: AppColors.bgcolor,
            surfaceTintColor: Colors.transparent,
            titleSpacing: myPadding / 10,
            toolbarHeight: myPadding * 3,
            title: Text(Appstring.order),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(myPadding * 1.5),
              child: Padding(
                padding: EdgeInsets.only(left: myPadding / 1.5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Track and manage your orders effortlessly.",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColors.textcolor2,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 2)),
          SliverToBoxAdapter(child: Divider(color: AppColors.border)),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 4)),

          if (activeorders.isNotEmpty) ...[
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
              sliver: SliverToBoxAdapter(
                child: Topictitle(title: "Active Orders"),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding / 2)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
              sliver: SliverList.separated(
                itemCount: activeorders.length,
                itemBuilder: (context, i) =>
                    ActiveorderCard(order: activeorders[i]),
                separatorBuilder: (_, _) => SizedBox(height: myPadding * 1),
              ),
            ),
          ],
          SliverToBoxAdapter(child: SizedBox(height: myPadding/1,),),

          if (pastorders.isNotEmpty) ...[
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
              sliver: SliverToBoxAdapter(
                child: Topictitle(title: "Past Orders"),
              ),
            ),
                      SliverToBoxAdapter(child: SizedBox(height: myPadding/1.5,),),

            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
              sliver: SliverList.separated(
                itemCount: pastorders.length,
                itemBuilder: (context, i) =>
                    PastOrderCard(order: pastorders[i]),
                separatorBuilder: (_, _) => SizedBox(height: myPadding / 1.5),
              ),
            ),
          ],
          SliverToBoxAdapter(child: SizedBox(height: myPadding * 5)),
        ],
      ),
    );
  }
}
