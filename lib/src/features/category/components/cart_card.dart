import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/config/constants/app_images.dart';
import 'package:hollycoffee/src/features/category/models/cart_model.dart';

class Cartcard extends StatelessWidget {
  final Cartmodel item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onDelete;
  const Cartcard({
    super.key,
    required this.item,
    required this.onDecrease,
    required this.onDelete,
    required this.onIncrease,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedSuperellipseBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(myPadding/1.2)
      ),
      elevation: 0,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: myPadding/1.15,vertical: myPadding/2.5),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(myPadding / 1.5),
              child: Image.network(
                Appimages.categorycard,
                height: myPadding*5.5,
                width: myPadding * 5.5,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: myPadding * .7),
            Expanded(
              child: SizedBox(
                height: myPadding * 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: myPadding*11,
                      child: Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: myPadding * 1.1,
                          height: 1.5,
                        ),
                      ),
                    ),
                     Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "\$ ${item.price.toStringAsFixed(2)}",
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: myPadding * 1.25,
                            ),
                          ),
                        ),
                        RoundButton(
                          icon: item.qty > 1
                              ? Icons.remove
                              : Icons.delete_sharp,
                          onTap: item.qty > 1 ? onDecrease : onDelete,
                        ),
                        SizedBox(
                          width: myPadding * 2,
                          child: Center(
                            child: Text(
                              "${item.qty}",
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                        ),
                        RoundButton(
                          icon: Icons.add,
                          filled: true,
                          onTap: onIncrease,
                        ),
                      ],
                    ),
                  ],
                ),
              
              ),
            ),
          ],
        ),
      ),
      );
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final bool filled;
  final VoidCallback onTap;
  const RoundButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: myPadding * 1.3,
        backgroundColor: filled ? AppColors.primary : AppColors.bgcolor,
        child: Icon(
          icon,
          size: myPadding * 1.3,
          color: filled ? AppColors.bgcolor : AppColors.textcolor2,
        ),
      ),
    );
  }
}
