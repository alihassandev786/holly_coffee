import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/constants/app_images.dart';
import 'package:hollycoffee/src/constants/app_string.dart';
import 'package:hollycoffee/src/features/profile/components/review_card.dart';
import 'package:hollycoffee/src/features/profile/models/to_review_model.dart';

class Toreview extends StatefulWidget {
  const Toreview({super.key});

  @override
  State<Toreview> createState() => _ToreviewState();
  static const route = "/toreview";
}

class _ToreviewState extends State<Toreview> {
  final List<Toreviewmodel> pending = [
    Toreviewmodel(
      image: Appimages.categorycard,
      id: "r1",
      title: "Cold Brew of the saints",
      category: "Matcha",
    ),
    Toreviewmodel(
      image: Appimages.categorycard,
      id: "r2",
      title: "Cold Brew of the saints",
      category: "Matcha",
    ),
    Toreviewmodel(
      image: Appimages.categorycard,
      id: "r3",
      title: "Cold Brew of the saints",
      category: "Matcha",
    ),
    Toreviewmodel(
      image: Appimages.categorycard,
      id: "r4",
      title: "Cold Brew of the saints",
      category: "Matcha",
    ),
  ];
  void submit(Toreviewmodel item, int rating, String text) {
    setState(() => pending.removeWhere((e) => e.id == item.id));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            floating: true,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            titleSpacing: myPadding / 10,
            title: Text(
              Appstring.toreview,
              
            ),
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.fromLTRB(
              myPadding / 1.5,
              0,
              myPadding / 1.5,
              myPadding / 1,
            ),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Icon(Icons.star_outline_rounded, color: theme.primaryColor),
                  SizedBox(width: myPadding / 3),
                  Text(
                    "Pending Reviews",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: myPadding / 1.5),
                  SizedBox(
                    width: myPadding * 8,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedSuperellipseBorder(
                          borderRadius: BorderRadiusGeometry.circular(
                            myPadding / 2,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "${pending.length} Pendings",
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: AppColors.bgcolor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding/1.1),
            sliver: SliverList.separated(
              itemCount: pending.length,
              itemBuilder: (context, i) {
                final item = pending[i];
                return Reviewcard(
                  item: item,
                  onSubmit: (rating, text) => submit(item, rating, text),
                );
              },
              separatorBuilder: (_, _) => SizedBox(height: myPadding / 1.5),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding*2,),)
        ],
      ),
    );
  }
}
