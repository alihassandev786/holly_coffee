import 'package:flutter/material.dart';
import 'package:hollycoffee/presentation/bottomnavigation/home.dart';
import 'package:hollycoffee/presentation/bottomnavigation/bottomnavigation.dart';
import 'package:hollycoffee/presentation/bottomnavigation/category.dart';
import 'package:hollycoffee/presentation/bottomnavigation/gifts.dart';
import 'package:hollycoffee/presentation/bottomnavigation/profile.dart';
class Homeroutes extends StatefulWidget {
  const Homeroutes({super.key});

  @override
  State<Homeroutes> createState() => _HomeroutesState();
}

class _HomeroutesState extends State<Homeroutes> {
  final List<Widget> screens=[
    Home(),
    Category(),
    Gifts(),
    Profile(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Bottomnavigationwidget(
        selectedIndex: selectedIndex,
       ontap: (index){
        setState(() {
          selectedIndex=index;
        });
       }),
    );
  }
}