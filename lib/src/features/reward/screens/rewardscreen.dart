import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/config/constants/app_string.dart';
import 'package:hollycoffee/src/features/reward/data/voucher_data.dart';
import 'package:hollycoffee/src/features/reward/components/reward_chip.dart';
import 'package:hollycoffee/src/features/reward/components/reward_point_card.dart';
import 'package:hollycoffee/src/features/reward/components/voucher_card.dart';

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
              titleSpacing: myPadding / 1.5,
              title: Text(
                Appstring.rewards,
              ),
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: myPadding / 1.5,
                vertical: 0,
              ),
              sliver: SliverToBoxAdapter(
                child: Rewardpointcard(currentpoints: 120, totalpoints: 200),
              )
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding / 1.5)),
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
