import 'package:flutter/material.dart';
import 'package:hollycoffee/core/apptheme/appcolors.dart';
import 'package:hollycoffee/core/apptheme/apptheme.dart';
import 'package:hollycoffee/core/constants/appstring.dart';
import 'package:hollycoffee/data/menudata.dart';
import 'package:hollycoffee/presentation/widgets/categorycard.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const categories = Menudata.categories;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            floating: true,
            backgroundColor: AppColors.bgcolor,
            surfaceTintColor: Colors.transparent,
            titleSpacing: myPadding / 1.2,
            title: Text(
              Appstring.categoriestitle,
              style: theme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: myPadding * 1.4,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding / 1.3),
            sliver: SliverAppBar(
              floating: false,
              primary: false,
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.bgcolor,
              surfaceTintColor: Colors.transparent,
              toolbarHeight: myPadding * 3.5,
              titleSpacing: 0,
              title: TextField(
                decoration: InputDecoration(
                  hintText: Appstring.hintText,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding / 1,vertical: myPadding/1),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final Category = categories[index];
                return Categorycard(category: Category, ontap: () {});
              },childCount: categories.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: myPadding / 1,
                mainAxisSpacing: myPadding / 1,
                mainAxisExtent: myPadding * 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
