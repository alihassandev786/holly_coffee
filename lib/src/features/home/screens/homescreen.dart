import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/config/constants/app_string.dart';
import 'package:hollycoffee/src/features/home/components/category_chip.dart';
import 'package:hollycoffee/src/features/home/components/location_sheet.dart';
import 'package:hollycoffee/src/features/home/components/popular_drink_card.dart';
import 'package:hollycoffee/src/features/home/components/top_rated_banner.dart';
import 'package:hollycoffee/src/features/home/data/menu_data.dart';
import 'package:hollycoffee/src/features/home/screens/menuscreen.dart';


class Home extends StatefulWidget {
  static const route = "/home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Locationresult? location;

@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)=>asklocation());
  }
   Future <void> asklocation () async{
  final Result = await LocationSheet.show(context);
  if(Result != null && mounted){
    setState(() => location = Result);

  }
}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
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
                        fontSize: myPadding * 1.2,
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
                backgroundColor: theme.colorScheme.surface,
                child: Icon(Icons.person),
              ),
            ],
          ),

          SliverToBoxAdapter(child: SizedBox(height: myPadding * 1.5)),
          SliverToBoxAdapter(child: Topratedbanner()),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsGeometry.only(left: myPadding / 1.5),
              child: HomeListTile(title: Appstring.categoriestitle, onPressed: (){
                Navigator.of(context).pushNamed("/menu");
              })
            ),
          ),

          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding / 1.5),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = Menudata.homecategories[index];
                return Categorychip(category: item,ontap: (){
                  Navigator.of(context).pushNamed(Menu.route,arguments: item.id);
                },);
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
              child: HomeListTile(title: Appstring.currentordertitle, onPressed: (){})
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
              child: HomeListTile(title: Appstring.populardrinkstitle, onPressed: (){})
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
  const HomeListTile({super.key,required this.title,required this.onPressed});

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
