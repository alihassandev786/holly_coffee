import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/auth/component/custom_circle.dart';
import 'package:hollycoffee/src/features/auth/component/slidebutton.dart';

class Splashscreen extends StatefulWidget {
  static const route = "/splash";
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/loginbackground.png",
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  iconTheme: Theme.of(
                    context,
                  ).iconTheme.copyWith(color: AppColors.bgcolor),
                  titleSpacing: 0,
                  title: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/otpverify.svg",
                        height: myPadding * 1.8,
                        width: myPadding * 1.8,
                      ),
                      SizedBox(width: myPadding / 2),
                      Text(
                        "Holy Coffee",
                        style: text.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.bgcolor,
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: myPadding * 27,
                    height: myPadding * 27,
                    child: CustomPaint(
                      painter: Circlespainter(gap: 0.07),
                      child: Center(
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.0008)
                            ..rotateY(math.pi)
                            ..rotateZ(0 * math.pi / 180),
                          child: Image.asset(
                            "assets/images/home1.png",
                            height: myPadding * 23,
                            width: myPadding * 23,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: myPadding / 1),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Text(
                          "Master the art of brewing with yummy coffee !",
                          style: text.headlineLarge?.copyWith(
                            color: AppColors.bgcolor,
                            fontWeight: FontWeight.w900,
                            fontSize: myPadding * 2.6,
                          ),
                        ),
                        SizedBox(height: myPadding / 1.2),
                        Row(
                          children: [
                            Container(
                              width: myPadding * 3.5,
                              height: myPadding / 1.6,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  myPadding * 1,
                                ),
                              ),
                            ),
                            ...List.generate(
                              3,
                              (_) => Container(
                                margin: EdgeInsets.only(left: myPadding / 3),
                                width: myPadding / 1.6,
                                height: myPadding / 1.6,
                                decoration: const BoxDecoration(
                                  color: Colors.white54,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: myPadding * 1)),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: myPadding / 1.2,
                    vertical: myPadding * 2,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Slidebutton(
                      iconcolor: AppColors.textcolor1,
                      onComplete: () {
                        Navigator.of(context).pushReplacementNamed("/home");
                      },
                      lable: "Next",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
