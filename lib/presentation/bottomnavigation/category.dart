import 'package:flutter/material.dart';
import 'package:hollycoffee/core/apptheme/appcolors.dart';
import 'package:hollycoffee/core/apptheme/apptheme.dart';
import 'package:hollycoffee/core/constants/appstring.dart';
import 'package:hollycoffee/data/menudata.dart';
import 'package:hollycoffee/presentation/widgets/populardrinkcard.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String selectedCategory = "hot_lattes";
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filterdproducts = Menudata.getProducts(selectedCategory);
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
          SliverAppBar(
            floating: false,
            primary: false,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.bgcolor,
            surfaceTintColor: Colors.transparent,
            toolbarHeight: myPadding*5,
            titleSpacing: 0,
            title: Padding(
              padding: EdgeInsetsGeometry.only(
                left: myPadding / 1.4,
              ),
              child: Menucategorytab(
                selectedCategory: selectedCategory,
                onCategoryselected: (id) {
                  setState(() {
                    selectedCategory = id;
                  });
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding/1.2,vertical: myPadding/5),
              child: Text(
                "${filterdproducts.length} Results",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding/1.5,),),
          SliverList(delegate: SliverChildBuilderDelegate((context, index){
            final product = filterdproducts[index];
            return Padding(
              padding:  EdgeInsets.only(bottom: myPadding/2,top:0,right: myPadding/1.3,left: myPadding/1.3),
              child: Populardrinkcard(categorycard: product),
            );
          },
          childCount: filterdproducts.length,
          )),
        ],
      ),
    );
  }
}

class Menucategorytab extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategoryselected;
  const Menucategorytab({
    super.key,
    required this.selectedCategory,
    required this.onCategoryselected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: myPadding * 5,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: myPadding / 1.5),
        itemBuilder: (context, index) {
          final Category = Menudata.categories[index];
          final isSelected = selectedCategory == Category.id;
          return GestureDetector(
            onTap: () {
              onCategoryselected(Category.id);
            },
            child: Container(
              padding: EdgeInsets.only(
                left: myPadding / 2.7,
                bottom: myPadding / 2.7,
                top: myPadding / 2.7,
                right: myPadding / 1.4,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : theme.canvasColor,
                borderRadius: BorderRadius.circular(myPadding * 4),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: myPadding * 1.5,
                    backgroundColor: AppColors.bgcolor,
                    child: Image.network(
                      Category.image,
                      height: myPadding * 1.8,
                      width: myPadding * 1.8,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: myPadding * .4),
                  Text(
                    Category.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: isSelected
                          ? AppColors.bgcolor
                          : AppColors.textcolor1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: myPadding * .6);
        },
        itemCount: Menudata.categories.length,
      ),
    );
  }
}
