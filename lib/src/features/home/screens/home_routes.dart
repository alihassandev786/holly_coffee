import 'package:flutter/material.dart';
import 'package:hollycoffee/src/features/category/screens/categoryscreen.dart';
import 'package:hollycoffee/src/features/home/screens/homescreen.dart';
import 'package:hollycoffee/src/features/home/components/bottomnavigation.dart';
import 'package:hollycoffee/src/features/reward/screens/rewardscreen.dart';
import 'package:hollycoffee/src/features/profile/screens/profilescreen.dart';
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