import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/constants/app_string.dart';

class Topratedbanner extends StatefulWidget {
  const Topratedbanner({super.key});

  @override
  State<Topratedbanner> createState() => _TopratedbannerState();
}

class _TopratedbannerState extends State<Topratedbanner> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding / 1.5),
          child: Card(
            color: theme.primaryColor,
            elevation: 0,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: myPadding / 1.2,
                vertical: myPadding * 1.3,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Appstring.topratedtitle,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: AppColors.bgcolor,
                          fontWeight: FontWeight.w700,
                          fontSize: myPadding * 1.5,
                          fontFamily: GoogleFonts.annapurnaSil().fontFamily,
                        ),
                      ),
                      SizedBox(height: myPadding / 2),
                      Text(
                        Appstring.featuredproduct,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontFamily: GoogleFonts.annapurnaSil().fontFamily,
                          fontSize: myPadding * 1.24,
                          color: AppColors.bgcolor,
                        ),
                      ),
                      SizedBox(height: myPadding * .2),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedSuperellipseBorder(
                            borderRadius: BorderRadius.circular(myPadding / 2),
                          ),
                          backgroundColor: AppColors.bgcolor,
                          padding: EdgeInsets.symmetric(
                            horizontal: myPadding * 1.5,
                            vertical: myPadding * .3,
                          ),
                        ),

                        child: Text(
                          Appstring.tryit,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: myPadding - 30,
          top: myPadding * 5.2,
          child: SizedBox(
            height: myPadding * 6,
            width: myPadding * 11,
            child: Card(
              elevation: 0,
              color: AppColors.clipoval.withAlpha(100),
              shape: OvalBorder(),
            ),
          ),
        ),
        Positioned(
          left: myPadding * 12.8,
          bottom: myPadding - 20,
          child: Image(
            image: AssetImage("assets/images/home1.png"),
            height: myPadding * 12,
            width: myPadding * 14,
          ),
        ),
      ],
    );
  }
}
