import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';

class MapPin extends StatelessWidget {
  final Widget child;
  const MapPin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          elevation: 2,
          margin: EdgeInsets.zero,
          color: AppColors.bgcolor,
          shape: CircleBorder(),
          child: SizedBox(
            height: myPadding * 2.6,
            width: myPadding * 2.6,
            child: Center(child: child),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -myPadding * .6),
          child: Icon(
            Icons.arrow_drop_down,
            color: AppColors.bgcolor,
            size: myPadding * 1.6,
          ),
        ),
      ],
    );
  }
}

class Pinavator extends StatelessWidget {
  final String? imageUrl;
  const Pinavator({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final fallback = ColoredBox(
      color: AppColors.border,
      child: Icon(Icons.person, color: AppColors.textcolor2),
    );
    return SizedBox(
      height: myPadding*2.2,
      width: myPadding*2.2,
      child: imageUrl == null?fallback:Image.network(imageUrl!,fit: BoxFit.cover,errorBuilder: (_, __, ___) =>fallback,),
    );
  }
}
