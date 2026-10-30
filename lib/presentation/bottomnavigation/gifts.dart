import 'package:flutter/material.dart';
import 'package:hollycoffee/core/apptheme/appcolors.dart';
import 'package:hollycoffee/core/apptheme/apptheme.dart';
import 'package:hollycoffee/core/constants/appstring.dart';
import 'package:hollycoffee/data/voucherdata.dart';
import 'package:hollycoffee/presentation/widgets/rewardchip.dart';
import 'package:hollycoffee/presentation/widgets/rewardpointcard.dart';
import 'package:hollycoffee/presentation/widgets/vouchercard.dart';

class Gifts extends StatefulWidget {
  const Gifts({super.key});

  @override
  State<Gifts> createState() => _GiftsState();
}

class _GiftsState extends State<Gifts> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary.withAlpha(100), AppColors.bgcolor],
            stops: [0.1, 0.8],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: false,
              automaticallyImplyLeading: false,
              floating: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              titleSpacing: myPadding / 1.2,
              title: Text(
                Appstring.rewards,
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: myPadding * 1.4,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: myPadding / 1.5,
                vertical: 0,
              ),
              sliver: SliverAppBar(
                backgroundColor: Colors.transparent,
                toolbarHeight: myPadding * 9,
                primary: false,
                automaticallyImplyActions: false,
                floating: true,
                titleSpacing: 0,
                title: Rewardpointcard(currentpoints: 120, totalpoints: 200),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding / 1.8)),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: myPadding / 1.5,
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Rewardchip(
                        icon: Icons.access_time_outlined,
                        title: Appstring.activitychip,
                      ),
                    ),
                    SizedBox(width: myPadding * 1),
                    Expanded(
                      child: Rewardchip(
                        icon: Icons.volunteer_activism_outlined,
                        title: Appstring.howtoearnchip,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding / 1)),

            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
              sliver: SliverToBoxAdapter(
                child: Text(
                  Appstring.availablevoucher,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: myPadding / 1.5,
                vertical: myPadding / 1,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((Context, index) {
                  final voucher = Voucherdata.vouchers[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: myPadding / 1.5),
                    child: Vouchercard(voucher: voucher, onApply: () {}),
                  );
                }, childCount: Voucherdata.vouchers.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
