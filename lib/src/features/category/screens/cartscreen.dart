import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/config/constants/app_images.dart';
import 'package:hollycoffee/config/constants/app_string.dart';
import 'package:hollycoffee/src/features/category/components/cart_card.dart';
import 'package:hollycoffee/src/features/category/models/cart_model.dart';

class Cart extends StatefulWidget {
  static const route = "/cart";
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final List<Cartmodel> items = [
    Cartmodel(
      image: Appimages.categorycard,
      price: 4.99,
      title: "Cold Brew of the Saints",
      id: "c1",
    ),
    Cartmodel(
      image: Appimages.categorycard,
      price: 4.99,
      title: "Cold Brew of the Saints",
      id: "c2",
    ),
    Cartmodel(
      image: Appimages.categorycard,
      price: 4.99,
      title: "Cold Brew of the Saints",
      id: "c3",
    ),
    Cartmodel(
      image: Appimages.categorycard,
      price: 4.99,
      title: "Cold Brew of the Saints",
      id: "c4",
    ),
  ];
  double get total => items.fold(0, (sum, e) => sum + e.lineTotal);
  int get count => items.fold(0, (sum, e) => sum + e.qty);
  void increase(Cartmodel item) => setState(() => item.qty++);
  void decrease(Cartmodel item) {
    setState(() {
      if (item.qty > 1) {
        item.qty--;
      } else {
        items.removeWhere((e) => e.id == item.id);
      }
    });
  }

  void remove(Cartmodel item) {
    setState(() => items.removeWhere((e) => e.id == item.id));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: false,
                floating: true,
                backgroundColor: AppColors.bgcolor,
                surfaceTintColor: Colors.transparent,
                titleSpacing: myPadding / 10,
                toolbarHeight: myPadding * 3, // title wali row chhoti
                title: Text(
                  Appstring.carttitle,
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(
                    myPadding * 1.5,
                  ), // text jitni height
                  child: Padding(
                    padding: EdgeInsets.only(left: myPadding / 1.5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "$count items in your cart",
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: AppColors.textcolor2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (items.isEmpty)
                SliverFillRemaining(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: myPadding * 2.5,
                        backgroundColor: theme.cardColor,
                        child: Icon(
                          Icons.delete,
                          color: AppColors.error,
                          size: myPadding * 2.5,
                        ),
                      ),
                      SizedBox(height: myPadding * 2),
                      Text(
                        "Your cart is empty",
                        style: theme.textTheme.titleLarge,
                      ),
                    ],
                  ),
                )
              else
                SliverPadding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: myPadding / 1.5,
                    vertical: myPadding*1.2,
                  ),
                  sliver: SliverList.separated(
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      final item = items[i];
                      return Cartcard(
                        key: ValueKey(item.id),
                        item: item,
                        onDecrease: () => decrease(item),
                        onDelete: () => remove(item),
                        onIncrease: () => increase(item),
                      );
                    },
                    separatorBuilder: (_, __) =>
                        SizedBox(height: myPadding / 1.5),
                  ),
                ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.bgcolor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -1),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  myPadding * 1,
                  myPadding / 1.5,
                  myPadding * 1,
                  myPadding * 1.7,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Total:",
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: AppColors.textcolor2,
                          ),
                        ),
                        Text(
                          "\$ ${total.toStringAsFixed(2)}",
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontSize: myPadding * 1.2,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      height: myPadding * 3.3,
                      width: myPadding * 13,
                      child: ElevatedButton.icon(
                        onPressed: items.isEmpty ? null : () {
                          Navigator.of(context).pushNamed("/checkoutpage");
                        },
                        iconAlignment: IconAlignment.end,
                        label: Text(
                          "Checkout",
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: AppColors.bgcolor,
                            fontWeight: FontWeight.w800,
                            fontSize: myPadding * 1.2,
                          ),
                        ),
                        icon: Icon(
                          Icons.keyboard_double_arrow_right,
                          size: myPadding * 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
