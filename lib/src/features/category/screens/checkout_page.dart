import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/constants/app_images.dart';
import 'package:hollycoffee/src/constants/app_string.dart';
import 'package:hollycoffee/src/features/category/components/delivery_card.dart';
import 'package:hollycoffee/src/features/category/components/address_card.dart';
import 'package:hollycoffee/src/features/category/components/ordertype_sheet.dart';
import 'package:hollycoffee/src/features/category/components/payment_card.dart';
import 'package:hollycoffee/src/features/category/components/topictitle.dart';
import 'package:hollycoffee/src/features/category/models/order_model.dart';
import 'package:hollycoffee/src/features/category/screens/delivery_orderscreen.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class Checkoutpage extends StatefulWidget {
  const Checkoutpage({super.key});
  static const route = "/checkoutpage";

  @override
  State<Checkoutpage> createState() => _CheckoutpageState();
}

class _CheckoutpageState extends State<Checkoutpage> {
  Future<void> openordertype()async{
    final result =await OrdertypeSheet.show(context);
    if(result == null || !mounted) return;
    Navigator.of(context).pushNamed(DeliveryOrderscreen.route,
    arguments: result == 0? Ordertype.delivery:Ordertype.pickup);
    
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
                toolbarHeight: myPadding * 3,
                title: Text(Appstring.checkouttitle),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(
                    myPadding * 1.5,
                  ),
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
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: myPadding / 1.5,
                ),
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
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: myPadding / 1.5,
                ),
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
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: myPadding / 1.5,
                ),
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
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: myPadding / 1.5,
                ),
                sliver: SliverToBoxAdapter(
                  child: Topictitle(title: "Delivery Address"),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: myPadding / 1.5)),

              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: myPadding / 1.5,
                ),

                sliver: SliverToBoxAdapter(child: AddressCard()),
              ),
              SliverToBoxAdapter(child: SizedBox(height: myPadding / 1.5)),
              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: myPadding / 1.5,
                ),

                sliver: SliverToBoxAdapter(
                  child: Topictitle(title: "Payment Method"),
                ),
              ),
              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: myPadding / 1.5,
                  vertical: myPadding / 1.5,
                ),
                sliver: SliverToBoxAdapter(child: PaymentCard()),
              ),
              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: myPadding / 1.2,
                ),

                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Topictitle(title: "Order Summary"),
                      OrderTile(title: "Sub-total", amount: "4* \$16.90"),
                      SizedBox(height: myPadding / 1.5),
                      OrderTile(title: "Delivery Fee", amount: "8.00"),
                      SizedBox(height: myPadding / 1.5),
                      OrderTile(title: "Discount", amount: "00.00"),
                      SizedBox(height: myPadding / 1.5),
                      OrderTile(title: "Total", amount: "16.90", istotal: true),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: myPadding * 1.3)),

              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
                sliver: SliverToBoxAdapter(
                  child: Divider(color: AppColors.border),
                ),
              ),
              SliverToBoxAdapter(
                child: ListTile(
                  leading: Icon(Icons.confirmation_num_outlined),
                  title: Text(
                    "Apply a Voucher",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: myPadding * 1.1,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: myPadding * 7)),
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
                child: SizedBox(
                  height: myPadding * 3.4,
                  child: ElevatedButton(
                    onPressed: openordertype,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Place Order ",
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontSize: myPadding * 1.2,
                            fontWeight: FontWeight.w800,
                            color: AppColors.bgcolor,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_double_arrow_right,
                          size: myPadding * 1.6,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class OrderTile extends StatelessWidget {
  final String title;
  final String amount;
  final bool istotal;
  const OrderTile({
    super.key,
    required this.title,
    required this.amount,
    this.istotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: myPadding * 2,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: istotal ? AppColors.textcolor1 : AppColors.textcolor2,
            fontSize: istotal ? myPadding * 1.4 : myPadding * 1.2,
          ),
        ),
        trailing: Text(
          "\$ $amount",
          style: theme.textTheme.titleLarge?.copyWith(
            color: istotal ? AppColors.primary : AppColors.textcolor1,
            fontSize: istotal ? myPadding * 1.4 : myPadding * 1.2,
          ),
        ),
      ),
    );
  }
}
