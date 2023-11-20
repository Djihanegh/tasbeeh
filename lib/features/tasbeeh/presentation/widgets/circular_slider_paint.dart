import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tasbeeh/core/app/export_app.dart';
import 'base_painter.dart';
import 'slider_painter.dart';
import 'utils.dart';

enum CircularSliderMode { singleHandler, doubleHandler }

enum SlidingState { none, endIsBiggerThanStart, endIsSmallerThanStart }

typedef SelectionChanged<T> = void Function(T a, T b, T c);

class CircularSliderPaint extends StatefulWidget {
  final int init;
  final int end;
  final int divisions;
  final SelectionChanged<int> onSelectionChange;
  final SelectionChanged<int> onSelectionEnd;
  final Color baseColor;
  final double handlerOutterRadius;
  final Widget? child;
  final bool showRoundedCapInSelection;

  final double sliderStrokeWidth;

  const CircularSliderPaint({
    super.key,
    required this.divisions,
    required this.init,
    required this.end,
    this.child,
    required this.onSelectionChange,
    required this.onSelectionEnd,
    required this.baseColor,
    required this.handlerOutterRadius,
    required this.showRoundedCapInSelection,
    required this.sliderStrokeWidth,
  });

  @override
  State<CircularSliderPaint> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSliderPaint> {
  SliderPainter? _painter;

  /// start angle in radians where we need to locate the init handler
  double? _startAngle;

  /// end angle in radians where we need to locate the end handler
  double? _endAngle;

  /// the absolute angle in radians representing the selection
  double? _sweepAngle;

  @override
  void initState() {
    _calculatePaintData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        TapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
                () => TapGestureRecognizer(),
                (TapGestureRecognizer instance) =>
                    customTapRecognizer(instance))
      },
      child: CustomPaint(
        painter: BasePainter(
          baseColor: widget.baseColor,
          sliderStrokeWidth: widget.sliderStrokeWidth,
        ),
        foregroundPainter: _painter,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: widget.child,
        ),
      ),
    );
  }

  double _currentAngle = 0.0;

  void _calculatePaintData() {
    var initPercent = 0.0;

    var endPercent = valueToPercentage(widget.end, widget.divisions);
    var sweep = getSweepAngle(initPercent, endPercent);

    var previousStartAngle = _startAngle;

    if (previousStartAngle == null) {
      _startAngle = 0.0;
    }

    _currentAngle = 0.0;
    _endAngle = percentageToRadians(endPercent);
    _sweepAngle = percentageToRadians(sweep.abs());

    _painter = SliderPainter(
        currentAngle: _currentAngle,
        endAngle: _endAngle!,
        sweepAngle: _sweepAngle!,
        handlerOutterRadius: widget.handlerOutterRadius,
        showRoundedCapInSelection: widget.showRoundedCapInSelection,
        sliderStrokeWidth: widget.sliderStrokeWidth,
        selectionColor: lightTheme.colorScheme.primary.withOpacity(0.5));
  }

  TapGestureRecognizer customTapRecognizer(TapGestureRecognizer instance) {
    return instance
      ..onTapDown = (TapDownDetails details) {}
      ..onTapUp = (TapUpDetails details) {}
      ..onTap = () {
        setState(() {
          widget.onSelectionChange(0, 0, 0);
        });
      }
      ..onTapCancel = () {};
  }
}
