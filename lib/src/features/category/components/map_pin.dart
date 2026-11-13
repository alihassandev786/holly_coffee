import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';

class MapPin extends StatelessWidget {
  final Widget child;
  final double scale;
  const MapPin({super.key, required this.child, this.scale = 1.0});
  static double SizeOf(double scale) => myPadding * 2.8 * scale;
  static double heightof(double scale) => SizeOf(scale) * 1.25;

  @override
  Widget build(BuildContext context) {
    final size = SizeOf(scale);
    return SizedBox(
      width: size,
      height: heightof(scale),
      child: CustomPaint(
        painter: _PinPainter(
          color: AppColors.bgcolor,
          shadowColor: AppColors.textcolor1,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: size,
            height: size,
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
  final double scale;
  const Pinavatar({super.key, this.imageUrl, this.scale = 1.0});

  @override
  Widget build(BuildContext context) {
    final fallback = ColoredBox(
      color: AppColors.border,
      child: Icon(Icons.person, color: AppColors.textcolor2),
    );
    final avatarSize = MapPin.SizeOf(scale) - myPadding * .6 * scale;

    return ClipOval(
      child: SizedBox(
        height: avatarSize,
        width: avatarSize,
        child: imageUrl == null
            ? fallback
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => fallback,
              ),
      ),
    );
  }
}
