import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tasbeeh/core/app/export_app.dart';

import 'circular_slider_paint.dart';
import 'utils.dart';

class SliderPainter extends CustomPainter {

  double endAngle;
  double sweepAngle;
  Color selectionColor;
  double handlerOutterRadius;
  bool showRoundedCapInSelection;
  double sliderStrokeWidth;
  Offset? initHandler;
  Offset? endHandler;
  Offset? center;
  double? radius;
  double currentAngle;

  SliderPainter(
      {
      required this.endAngle,
      required this.sweepAngle,
      required this.selectionColor,
      required this.handlerOutterRadius,
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

    Paint handler = _getPaint(
        color: lightTheme.colorScheme.error, style: PaintingStyle.fill);
    Paint handlerOutter =
        _getPaint(color: lightTheme.colorScheme.error, width: 6.0);

    // draw handlers

    initHandler =
        radiansToCoordinates(center!, -pi / 2 + currentAngle, radius!);

    canvas.drawCircle(initHandler!, 9.0, handler);
    canvas.drawCircle(initHandler!, handlerOutterRadius, handlerOutter);

    endHandler = radiansToCoordinates(center!, -pi / 2 + endAngle, radius!);

    canvas.drawCircle(endHandler!, handlerOutterRadius, handlerOutter);

    canvas.drawCircle(endHandler!, 9.0, handler);
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
