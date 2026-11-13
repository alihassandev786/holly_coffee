import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/home/components/add_remove_button.dart';
import 'package:hollycoffee/src/features/profile/components/transaction_tile.dart';
import 'package:hollycoffee/src/features/profile/components/transaction_type_sheet.dart';
import 'package:hollycoffee/src/features/profile/models/transactionmodel.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});
  static const route = "/wallet";

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  bool hideBalance = false;
  final double balance = 9760;
  Future<void> openTransactionsheet() async {
    final selected = await Transactiontypesheet.show(context);
    if (selected == null || !mounted) return;
    switch (selected) {
      case TransactionType.topUp:
        break;
      case TransactionType.withDraw:
        break;
      case TransactionType.shareBalance:
        break;
    }
  }

  final List<Transactionmodel> Transaction = [
    Transactionmodel(
      title: "Order Name",
      date: "March 24, 2025",
      amount: 4.99,
      isIncoming: false,
    ),
    Transactionmodel(
      title: "Bank Account Name",
      date: "March 24, 2025",
      amount: 4.99,
      isIncoming: true,
    ),
    Transactionmodel(
      title: "Bank Account Name",
      date: "March 24, 2025",
      amount: 4.99,
      isIncoming: true,
    ),
    Transactionmodel(
      title: "Bank Account Name",
      date: "March 24, 2025",
      amount: 4.99,
      isIncoming: true,
    ),
    Transactionmodel(
      title: "Order Name",
      date: "March 24, 2025",
      amount: 4.99,
      isIncoming: false,
    ),
  ];

  String get balanceText =>
      hideBalance ? "......." : "\$ ${balance.toStringAsFixed(2)}";
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
        iconTheme: IconThemeData(color: Colors.white),
            expandedHeight: myPadding * 14.5,
            backgroundColor: AppColors.primary,
            collapsedHeight: myPadding * 4,
            titleSpacing: myPadding / 10,
            shape: RoundedSuperellipseBorder(
              borderRadius: BorderRadiusGeometry.vertical(
                bottom: Radius.circular(myPadding * 1.5),
              ),
            ),
            centerTitle: false,
            title: Text(
              "My Wallet",style: theme.textTheme.titleLarge?.copyWith(
                color: AppColors.bgcolor,
                          fontWeight: FontWeight.w600,

              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: myPadding / 1.5),
                child: AddremoveButton(
                  icon: Icons.more_horiz,
                  onTap: () {
                    openTransactionsheet();
                  },
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Padding(
                padding: EdgeInsets.fromLTRB(
                  myPadding * 1,
                  myPadding * 7.6, // title row ke neeche se shuru
                  myPadding * 1,
                  myPadding * 1.5,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total Balance",
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: AppColors.bgcolor,
                            fontSize: myPadding * 1.1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: myPadding / 2),
                        GestureDetector(
                          onTap: () =>
                              setState(() => hideBalance = !hideBalance),
                          child: Icon(
                            hideBalance
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.bgcolor,
                            size: myPadding * 1.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: myPadding / 1.9),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          balanceText,
                          style: theme.textTheme.displaySmall?.copyWith(
                            color: AppColors.bgcolor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(width: myPadding / 3),
                        Text(
                          "USD",
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: AppColors.bgcolor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openTransactionsheet();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.bgcolor,
                        padding: EdgeInsets.symmetric(
                          vertical: myPadding / 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Top up",
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: AppColors.success,
                              fontSize: myPadding * 1.1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: myPadding / 2),
                          Icon(
                            Icons.south_west,
                            color: AppColors.success,
                            size: myPadding * 1.3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(
              vertical: myPadding / 1.5,
              horizontal: myPadding / 1.5,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Recent Transaction",
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: myPadding * 1.4,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding / 1.5),
            sliver: SliverList.separated(
              itemCount: Transaction.length,
              itemBuilder: (context, i) =>
                  Transactiontile(item: Transaction[i]),
              separatorBuilder: (_, _) => SizedBox(height: myPadding / 10),
            ),
          ),
        ],
      ),
    );
  }
}
