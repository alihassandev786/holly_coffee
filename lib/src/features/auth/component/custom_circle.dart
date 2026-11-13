import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';

class Circlespainter extends CustomPainter {
  final Color color;
  final double StrokeWidth;
  final int count;
  final double gap;
  Circlespainter({
    this.color = AppColors.circlecolor,
    this.StrokeWidth = 2,
    this.count = 4,
    this.gap = 0.09,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = StrokeWidth;

    final center = Offset(size.width / 2, size.height / 2);
    final maxradius = size.shortestSide / 2.4 - StrokeWidth;

    for (int i = 0; i < count; i++) {
      final radius = maxradius - (i * size.shortestSide * gap);
      if (radius > 0) {
        canvas.drawCircle(center, radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant Circlespainter old) =>
      old.color != color ||
      old.StrokeWidth != StrokeWidth ||
      old.count != count ||
      old.gap != gap;
}
