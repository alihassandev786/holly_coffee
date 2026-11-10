import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';

class MapPin extends StatelessWidget {
  final Widget child;
  const MapPin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: myPadding*2.8,
      height: myPadding*3.5,
      child: CustomPaint(
        painter: _PinPainter(
          color: AppColors.bgcolor,
          shadowColor: AppColors.textcolor1,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: myPadding*2.8,
            height: myPadding*2.8,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}


class _PinPainter extends CustomPainter {
  final Color color;
  final Color shadowColor;
  const _PinPainter({required this.color, required this.shadowColor});

  @override
  void paint(Canvas canvas, Size size) {
    final r = size.width / 2;

    // gol hissa
    final circle = Path()
      ..addOval(Rect.fromCircle(center: Offset(r, r), radius: r));

    final tail = Path()
      ..moveTo(r - r * 0.64, r + r * 0.77)
      ..lineTo(r, size.height)
      ..lineTo(r + r * 0.64, r + r * 0.77)
      ..close();

    final pin = Path.combine(PathOperation.union, circle, tail);

    canvas.drawShadow(pin, shadowColor, 4, true);
    canvas.drawPath(pin, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _PinPainter old) =>
      old.color != color || old.shadowColor != shadowColor;
}


class Pinavatar extends StatelessWidget {
  final String? imageUrl;
  const Pinavatar({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final fallback = ColoredBox(
      color: AppColors.border,
      child: Icon(Icons.person, color: AppColors.textcolor2),
    );
    return ClipOval(
      child: SizedBox(
        height: myPadding*2.2,
        width: myPadding*2.2,
        child: imageUrl == null
            ? fallback
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => fallback,
              ),
      ),
    );
  }
}