import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/home/models/product_model.dart';
import 'package:hollycoffee/src/features/home/components/add_on_card.dart';
import 'package:hollycoffee/src/features/home/components/add_remove_button.dart';
import 'package:hollycoffee/src/features/home/components/drink_size_card.dart';

class Productdetail extends StatefulWidget {
  final Productmodel product;
  const Productdetail({super.key, required this.product});

  static const route = "/productdetail";

  @override
  State<Productdetail> createState() => _ProductdetailState();
}

class _ProductdetailState extends State<Productdetail> {
  int quantity = 1;
  int selectedSize = 0;
  bool isFavorite = false;
  final Set<int> selectedAddOns = {};

  Animation<double>? _fade;

  Productmodel get product => widget.product;

  double get total {
    final sizePrice = product.sizes.isEmpty
        ? 0.0
        : product.sizes[selectedSize].price;
    final addOnsPrice = selectedAddOns.fold<double>(
      0,
      (sum, i) => sum + product.addon[i].price,
    );
    return (sizePrice + addOnsPrice) * quantity;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_fade == null) {
      final routeAnim = ModalRoute.of(context)?.animation;
      _fade = routeAnim == null
          ? kAlwaysCompleteAnimation
          : CurvedAnimation(
              parent: routeAnim,
              curve: const Interval(0.45, 1.0, curve: Curves.easeOut),
            );
    }
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
                iconTheme: IconThemeData(color: AppColors.bgcolor),
                pinned: true,
                expandedHeight: myPadding * 18,
                backgroundColor: AppColors.bgcolor,
                titleSpacing: 0,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: myPadding * 1),
                    child: GestureDetector(
                      onTap: () => setState(() {
                        isFavorite = !isFavorite;
                      }),
                      child: CircleAvatar(
                        radius: myPadding * 1.5,
                        backgroundColor: AppColors.bgcolor,
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite
                              ? AppColors.success
                              : AppColors.textcolor1,
                        ),
                      ),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Hero(
                        tag: productHeroTag(product.id),
                        child: Image.network(product.image, fit: BoxFit.cover),
                      ),
                      Positioned(
                        left: myPadding * 1,
                        bottom: myPadding * 2.5,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: myPadding * .8,
                            vertical: myPadding / 2.8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.bgcolor,
                            borderRadius: BorderRadius.circular(myPadding * 2),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: AppColors.primary,
                                size: 20,
                              ),
                              SizedBox(width: myPadding / 3),
                              Text(
                                product.rating.toString(),
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(myPadding * 1.5),
                  child: Container(
                    height: myPadding * 1.5,
                    decoration: BoxDecoration(
                      color: AppColors.bgcolor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(myPadding * 2),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: myPadding * 6,
                        height: myPadding / 4,
                        decoration: BoxDecoration(
                          color: AppColors.textcolor2,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SliverFadeTransition(
                opacity: _fade ?? kAlwaysCompleteAnimation,
                sliver: SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: myPadding * 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                product.category,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: AppColors.textcolor2,
                                  fontSize: myPadding * 1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            AddremoveButton(
                              icon: Icons.remove,
                              onTap: () {
                                if (quantity > 1) {
                                  setState(() => quantity--);
                                }
                              },
                            ),
                            SizedBox(
                              width: myPadding * 2.5,
                              child: Center(
                                child: Text(
                                  "$quantity",
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            AddremoveButton(
                              icon: Icons.add,
                              filled: true,
                              onTap: () => setState(() => quantity++),
                            ),
                          ],
                        ),
                        SizedBox(height: myPadding / 2),
                        Text(
                          product.title,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: myPadding * 1.2,
                          ),
                        ),
                        SizedBox(height: myPadding * 1),
                        Divider(color: AppColors.textcolor2),
                        SizedBox(height: myPadding / 2),

                        if (product.description.isNotEmpty) ...[
                          Text(
                            "Description",
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: myPadding * 1.2,
                            ),
                          ),
                          SizedBox(height: myPadding / 2.3),
                          Text(
                            product.description,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: AppColors.textcolor2,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: myPadding * .9),
                          Divider(color: AppColors.textcolor2),
                          SizedBox(height: myPadding / 2.3),
                        ],

                        if (product.sizes.isNotEmpty) ...[
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Available in",
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: myPadding * 1.2,
                                  ),
                                ),
                              ),
                              Text(
                                "Required",
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: AppColors.error,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: myPadding * 1),
                          Row(
                            children: [
                              for (
                                int i = 0;
                                i < product.sizes.length;
                                i++
                              ) ...[
                                GestureDetector(
                                  onTap: () => setState(() => selectedSize = i),
                                  child: SizeCard(
                                    size: product.sizes[i],
                                    selected: selectedSize == i,
                                  ),
                                ),
                                SizedBox(width: myPadding * 1.3),
                              ],
                            ],
                          ),
                          SizedBox(height: myPadding * .8),
                          Divider(color: AppColors.textcolor2),
                          SizedBox(height: myPadding / 2.3),
                        ],

                        // Add Ons heading
                        if (product.addon.isNotEmpty) ...[
                          Text(
                            "Add Ons",
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: myPadding * 1.2,
                            ),
                          ),
                          SizedBox(height: myPadding * 1),
                        ],
                      ],
                    ),
                  ),
                ),
              ),

              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: myPadding * 1),
                sliver: SliverFadeTransition(
                  opacity: _fade ?? kAlwaysCompleteAnimation,
                  sliver: SliverList.separated(
                    itemCount: product.addon.length,
                    separatorBuilder: (_, _) =>
                        SizedBox(height: myPadding / 1.5),
                    itemBuilder: (context, i) {
                      final addOn = product.addon[i];
                      final selected = selectedAddOns.contains(i);
                      return AddOnTile(
                        addOn: addOn,
                        selected: selected,
                        onTap: () => setState(() {
                          selected
                              ? selectedAddOns.remove(i)
                              : selectedAddOns.add(i);
                        }),
                      );
                    },
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: SizedBox(height: myPadding * 9),
              ),
            ],
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: myPadding / 1.5,
                right: myPadding / 1.5,
                top: myPadding / 1.5,
                bottom: myPadding *2.5,
              ),
              decoration: BoxDecoration(
                color: AppColors.bgcolor,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.textcolor2,
                    blurRadius: 6,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total:",
                        style: theme.textTheme.bodyLarge?.copyWith(),
                      ),
                      Text(
                        "\$ ${total.toStringAsFixed(2)}",
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: AppColors.textcolor1,
                          fontSize: myPadding * 1.2,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    height: myPadding * 3,
                    width: myPadding * 14,
                    child: ElevatedButton.icon(
                      onPressed: (){},
                      label: Text(
                        "Add to Bag",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.bgcolor,
                          fontSize: myPadding * 1.2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      icon: Icon(Icons.shopping_bag),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
