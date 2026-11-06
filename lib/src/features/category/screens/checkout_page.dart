import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/config/constants/app_images.dart';
import 'package:hollycoffee/config/constants/app_string.dart';
import 'package:hollycoffee/src/features/category/components/delivery_card.dart';
import 'package:hollycoffee/src/features/category/components/address_card.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class Checkoutpage extends StatefulWidget {
  const Checkoutpage({super.key});
  static const route = "/checkoutpage";

  @override
  State<Checkoutpage> createState() => _CheckoutpageState();
}

class _CheckoutpageState extends State<Checkoutpage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            floating: true,
            backgroundColor: AppColors.bgcolor,
            surfaceTintColor: Colors.transparent,
            titleSpacing: myPadding / 10,
            toolbarHeight: myPadding * 3, // title wali row chhoti
            title: Text(Appstring.checkouttitle),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(
                myPadding * 1.5,
              ), // text jitni height
              child: Padding(
                padding: EdgeInsets.only(left: myPadding / 1.5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "4 items in your cart",
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
          SliverPadding(
            padding: EdgeInsetsGeometry.fromLTRB(
              myPadding / 1.5,
              myPadding / 1.5,
              myPadding / 1.5,
              0,
            ),
            sliver: SliverToBoxAdapter(child: Deliverycard()),
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding / 1.5),
            sliver: SliverToBoxAdapter(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "Items",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Text("1 item", style: theme.textTheme.bodyLarge),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding / 1.5),
            sliver: SliverToBoxAdapter(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(myPadding / 2),
                  child: Image.network(
                    Appimages.categorycard,
                    height: myPadding * 4,
                    width: myPadding * 4,
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cold Brew of the Saints",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: myPadding / 3),
                    Text(
                      "Matcha . QTY : 1 item",
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: AppColors.textcolor2,
                      ),
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(top: myPadding * 1.7),
                  child: Text(
                    "\$ 4.99",
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppColors.textcolor1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 3)),

          SliverToBoxAdapter(child: Divider(color: AppColors.border)),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding / 1.5),
            sliver: SliverToBoxAdapter(
              child: ListTile(
                contentPadding: EdgeInsets.zero,

                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: myPadding / 3),
                    Text(
                      "Alexa chider",
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: AppColors.textcolor2,
                      ),
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(top: myPadding * 1.7),
                  child: Icon(Iconsax.edit_2_copy),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 2)),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding / 1.5),
            sliver: SliverToBoxAdapter(
              child: Checkouttitle(title: "Delivery Address"),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 1.5)),

          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding / 1.5),

            sliver: SliverToBoxAdapter(child: AddressCard()),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 1.5)),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding / 1.5),

            sliver: SliverToBoxAdapter(
              child: Checkouttitle(title: "Payment Method"),
            ),
          ),
        ],
      ),
    );
  }
}

class Checkouttitle extends StatelessWidget {
  final String title;
  const Checkouttitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
