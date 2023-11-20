import 'dart:math';
import 'package:flutter/material.dart';

class SliderPainter extends CustomPainter {
  double sweepAngle;
  Color selectionColor;

  bool showRoundedCapInSelection;
  double sliderStrokeWidth;
  Offset? initHandler;
  Offset? endHandler;
  Offset? center;
  double? radius;
  double currentAngle;

  SliderPainter(
      {required this.sweepAngle,
      required this.selectionColor,
      required this.showRoundedCapInSelection,
      required this.sliderStrokeWidth,
      required this.currentAngle});

  @override
  void paint(Canvas canvas, Size size) {
    center = Offset(size.width / 2, size.height / 2);
    radius = min(size.width / 2, size.height / 2) - sliderStrokeWidth;

    Paint progress = _getPaint(color: selectionColor, width: 30);

    canvas.drawArc(Rect.fromCircle(center: center!, radius: radius!),
        -pi / 2 + currentAngle, sweepAngle, false, progress);
  }

  Paint _getPaint(
          {required Color color, double? width, PaintingStyle? style}) =>
      Paint()
        ..color = color
        ..strokeCap =
            showRoundedCapInSelection ? StrokeCap.round : StrokeCap.butt
        ..style = style ?? PaintingStyle.stroke
        ..strokeWidth = width ?? sliderStrokeWidth;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
