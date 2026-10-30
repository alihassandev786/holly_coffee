import 'package:flutter/material.dart';
import 'package:hollycoffee/core/apptheme/appcolors.dart';
import 'package:hollycoffee/core/apptheme/apptheme.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class Bottomnavigationwidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> ontap;
  const Bottomnavigationwidget({
    super.key,
    required this.selectedIndex,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: ontap,
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: navIcon(0, Iconsax.home_1, Iconsax.home_copy),
        ),
    
        BottomNavigationBarItem(
          label: '',
          icon: navIcon(1, Iconsax.category, Iconsax.category_copy),
        ),
    
        BottomNavigationBarItem(
          label: '',
          icon: navIcon(2, Iconsax.gift, Iconsax.gift_copy),
        ),
    
        BottomNavigationBarItem(
          label: '',
          icon: navIcon(3, Icons.person_rounded, Icons.person_outline_rounded),
        ),
      ],
    );
  }

  Widget navIcon(int index, IconData selectedIcon, IconData icon) {
    final isSelected = selectedIndex == index;

    return Padding(
      padding:  EdgeInsets.only(top: myPadding/1,bottom: myPadding/2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? selectedIcon : icon,
            size: myPadding * 2,
            color: isSelected ? AppColors.primary : AppColors.border,
          ),
          SizedBox(height: myPadding / 5),
          Container(
            height: myPadding / 2.2,
            width: myPadding / 2.2,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.transparent,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
