import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/config/constants/app_string.dart';
import 'package:hollycoffee/src/features/category/components/category_card.dart';
import 'package:hollycoffee/src/features/home/data/menu_data.dart';

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
            titleSpacing: myPadding / 1.5,
            title: Text(
              Appstring.categoriestitle,
              
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(myPadding * 4),
              child: Padding(
                padding:  EdgeInsets.fromLTRB(myPadding/1.3, 0,myPadding/1.3,myPadding/1.5),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: Appstring.hintText,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(myPadding * 2),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(myPadding * 3),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(myPadding * 3),
                      borderSide: BorderSide(
                        width: myPadding / 10,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: myPadding / 1,
              vertical: myPadding / 1.5,
            ),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final Category = categories[index];
                return Categorycard(category: Category, ontap: () {
                  Navigator.of(context).pushNamed("/cart");
                });
              }, childCount: categories.length),
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
