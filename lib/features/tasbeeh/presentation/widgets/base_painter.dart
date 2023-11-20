import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BasePainter extends CustomPainter {
  Color baseColor;
  double sliderStrokeWidth;
  Offset? center;
  double? radius;
  Offset? sectorCenter;
  double? sectorRadius;

  BasePainter({
    required this.baseColor,
    required this.sliderStrokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    center = Offset(size.width / 2, size.height / 2);
    radius = min(size.width / 2, size.height / 2) - sliderStrokeWidth;

    Paint base = Paint()
      ..color = baseColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30;
    sectorCenter = Offset(size.width / 2, size.height / 2);
    sectorRadius = min(size.width / 2.6, size.height / 2.6);

    // we need this in the parent to calculate if the user clicks on the circumference

    assert(radius! > 0);

    Path oval = Path()
      ..addOval(Rect.fromCircle(center: center!, radius: radius! - 0));
    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 50);
    canvas.drawPath(oval, shadowPaint);
    _drawBaseCircle(canvas);

    canvas.drawCircle(center!, radius!, base);

    canvas.translate(sectorRadius! + 30, sectorRadius! + 30);
  }

  void _drawBaseCircle(Canvas canvas) {
    final Paint _paint = Paint()
      ..shader = ui.Gradient.radial(Offset(center!.dx, center!.dy),
          radius! + 800, [const Color(0xFFfef9f6), const Color(0xFFfef9f6)])
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center!, radius!, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
