import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/config/constants/app_string.dart';
import 'package:hollycoffee/src/features/home/components/menu_category_tab.dart';
import 'package:hollycoffee/src/features/home/components/popular_drink_card.dart';
import 'package:hollycoffee/src/features/home/data/menu_data.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});
  static const route = "/menu";

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String selectedCategory = "hot_lattes";
  bool _initilized = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(_initilized) return;
    _initilized = true;
    final args = ModalRoute.of(context)?.settings.arguments;
    if(args is String && args.isNotEmpty){
      selectedCategory = args;
    }
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filterdproducts = Menudata.getProducts(selectedCategory);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            floating: true,
            backgroundColor: AppColors.bgcolor,
            surfaceTintColor: Colors.transparent,
            titleSpacing: myPadding / 1.5,
            title: Text(
              Appstring.categoriestitle,
              
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
                left: myPadding / 1.2,
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
              padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding/1,vertical: myPadding/5),
              child: Text(
                "${filterdproducts.length} Results",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding/1.5,),),
          SliverList(delegate: SliverChildBuilderDelegate((context, index){
            final product = filterdproducts[index];
            return Padding(
              padding:  EdgeInsets.only(bottom: myPadding/1.3,top:0,right: myPadding/1.2,left: myPadding/1.2),
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

