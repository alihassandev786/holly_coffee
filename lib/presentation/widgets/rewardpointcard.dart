import 'package:flutter/material.dart';
import 'package:hollycoffee/core/apptheme/appcolors.dart';
import 'package:hollycoffee/core/apptheme/apptheme.dart';
import 'package:hollycoffee/core/constants/appimages.dart';
import 'package:hollycoffee/core/constants/appstring.dart';

class Rewardpointcard extends StatelessWidget {
  final int currentpoints;
  final int totalpoints;
  const Rewardpointcard({
    super.key,
    required this.currentpoints,
    required this.totalpoints,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = totalpoints > 0
        ? (currentpoints / totalpoints).clamp(0.0, 1.0)
        : 0.0;
    return CustomPaint(
      foregroundPainter: GradientBorderPainter(
        radius: myPadding * .8,
        strokeWidth: myPadding / 12,
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(myPadding * .8),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: myPadding * 1.2,
            vertical: myPadding * 1.2,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: myPadding * 2,
                    backgroundColor: theme.canvasColor,
                    child: Image(
                      image: AssetImage(Appimages.rewardbannerimage),
                      height: myPadding * 2.4,
                      width: myPadding * 2.4,
                    ),
                  ),
                  SizedBox(width: myPadding / 1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Appstring.rewardpoint,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.textcolor2,
                          fontSize: myPadding * 1.2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              "$currentpoints",
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w900,
                                fontSize: myPadding * 2,
                              ),
                            ),
                            Text(
                              " / $totalpoints",
                              style: theme.textTheme.headlineMedium?.copyWith(
                                color: AppColors.textcolor2.withAlpha(90),
                                fontWeight: FontWeight.w900,
                                fontSize: myPadding * 2,
                              ),
                            ),
                            SizedBox(width: myPadding / 2),
                            Image(
                              image: AssetImage(Appimages.imojibannerimage),
                              height: myPadding * 1.4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: myPadding / 1),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(myPadding / 1),
                child: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [AppColors.primary, AppColors.error],
                    ).createShader(bounds);
                  },
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: myPadding / 2,
                    backgroundColor: AppColors.textcolor2.withAlpha(80),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final double radius;
  final double strokeWidth;

  GradientBorderPainter({required this.radius, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColors.primary, Colors.red],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final border = RRect.fromRectAndRadius(
      rect.deflate(strokeWidth / 2),
      Radius.circular(radius - strokeWidth / 2),
    );

    canvas.drawRRect(border, paint);
  }

  @override
  bool shouldRepaint(covariant GradientBorderPainter oldDelegate) {
    return radius != oldDelegate.radius ||
        strokeWidth != oldDelegate.strokeWidth;
  }
}
