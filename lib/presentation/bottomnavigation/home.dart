import 'package:flutter/material.dart';
import 'package:hollycoffee/core/approutes/router.dart';
import 'package:hollycoffee/core/apptheme/appcolors.dart';
import 'package:hollycoffee/core/apptheme/apptheme.dart';
import 'package:hollycoffee/core/constants/appstring.dart';
import 'package:hollycoffee/data/menudata.dart';
import 'package:hollycoffee/presentation/widgets/Categorychip.dart';
import 'package:hollycoffee/presentation/widgets/populardrinkcard.dart';
import 'package:hollycoffee/presentation/widgets/topratedbanner.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: myPadding * 4,
            titleSpacing: myPadding / 2.2,
            backgroundColor: AppColors.bgcolor,
            title: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: theme.primaryColor,
                  size: myPadding * 1.7,
                ),
                SizedBox(width: myPadding / 3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Appstring.location,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: myPadding * 1,
                      ),
                    ),
                    SizedBox(height: myPadding / 2.5),
                    Text(
                      Appstring.coffeequestion,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
            actionsPadding: EdgeInsets.only(right: myPadding / 1.5),
            actions: [
              CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: theme.colorScheme.surface,
              ),
            ],
          ),

          SliverToBoxAdapter(child: SizedBox(height: myPadding * 1.5)),
          SliverToBoxAdapter(child: Topratedbanner()),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsGeometry.only(left: myPadding / 1.5),
              child: HomeListTile(
                title: Appstring.categoriestitle,
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.category);
                },
              ),
            ),
          ),

          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding / 1.5),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = Menudata.homecategories[index];
                return Categorychip(category: item);
              }, childCount: Menudata.homecategories.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: myPadding * 0.7,
                mainAxisSpacing: myPadding * 0.7,
                mainAxisExtent: myPadding * 4,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsGeometry.only(left: myPadding / 1.5),
              child: HomeListTile(
                title: Appstring.currentordertitle,
                onPressed: () {},
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: myPadding / 1.5,
              ),
              child: Card(
                elevation: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: myPadding * 0.7,
                    vertical: myPadding * 1,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(myPadding * .9),
                    gradient: LinearGradient(
                      colors: [AppColors.primary, Colors.red],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Appstring.orderpreparingmessage,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: AppColors.bgcolor,
                                fontSize: myPadding * 1.05,
                              ),
                            ),
                            SizedBox(height: myPadding * .7),
                            Row(
                              children: [
                                Text(
                                  Appstring.estimateddelivery,
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    color: AppColors.bgcolor,
                                  ),
                                ),
                                SizedBox(width: myPadding * .7),
                                Text(
                                  Appstring.deliverytime,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    color: AppColors.bgcolor,

                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: myPadding * 4,
                            width: myPadding * 4,
                            child: CircularProgressIndicator(
                              value: 0.65,
                              strokeWidth: myPadding * .7,
                              strokeCap: StrokeCap.round,
                              color: AppColors.textcolor1,
                              backgroundColor: AppColors.bgcolor,
                            ),
                          ),
                          Image.network(
                            "https://i.ibb.co/d4sDkpJP/home3.png",
                            height: myPadding * 3.3,
                          ),
                        ],
                      ),
                      SizedBox(width: myPadding * .4),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsGeometry.only(left: myPadding / 1.5),
              child: HomeListTile(
                title: Appstring.populardrinkstitle,
                onPressed: () {},
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  myPadding / 1.5,
                  0,
                  myPadding / 1.5,
                  myPadding / 1.5,
                ),
                child: Populardrinkcard(
                  categorycard: Menudata.popularproducts[index],
                ),
              );
            }, childCount: Menudata.popularproducts.length),
          ),
        ],
      ),
    );
  }
}

class HomeListTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const HomeListTile({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: TextButton(
        onPressed: onPressed,
        child: Text(
          Appstring.viewallbutton,
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.primary,
            decoration: TextDecoration.underline,

            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
