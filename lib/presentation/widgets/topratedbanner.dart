import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hollycoffee/core/apptheme/appcolors.dart';
import 'package:hollycoffee/core/apptheme/apptheme.dart';
import 'package:hollycoffee/core/constants/appstring.dart';

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
                horizontal: myPadding / 1.3,
                vertical: myPadding / 1,
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
                      SizedBox(height: myPadding / 2.5),
                      Text(
                        Appstring.featuredproduct,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontFamily: GoogleFonts.annapurnaSil().fontFamily,
                          fontSize: myPadding * 1.24,
                          color: AppColors.bgcolor,
                        ),
                      ),
                      SizedBox(height: myPadding - 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
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
          right: myPadding - 30, // Right side
          top: myPadding * 4.7, // Top se 10 pixels
          child: Container(
            height: myPadding * 5,
            width: myPadding * 10.5,
            decoration: ShapeDecoration(
              color: Color(0xffFFFFFF).withAlpha(100),
              shape: OvalBorder(),
            ),
          ),
        ),
        Positioned(
          left: myPadding * 12.8,
          bottom: myPadding * 0,
          child: Image(
            image: AssetImage("assets/images/home1.png"),
            height: myPadding * 11,
            width: myPadding * 13.5,
          ),
        ),
      ],
    );
  }
}
