import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tasbeeh/core/extension/context.dart';
import 'package:tasbeeh/core/extension/sized_box_extension.dart';
import '../../../../core/app/export_app.dart';
import '../../../../generated/assets.dart';
import 'double_circular_slider.dart';

class TasbeehCounter extends StatefulWidget {
  const TasbeehCounter({Key? key}) : super(key: key);

  @override
  State<TasbeehCounter> createState() => _TasbeehCounterState();
}

class _TasbeehCounterState extends State<TasbeehCounter> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  void _updateCounter() {
    setState(() {
      counter == 100 ? _resetCounter() : counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            20.heightXBox,
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: lightTheme.colorScheme.primary.withOpacity(0.5),
                      blurRadius: 17,
                      spreadRadius: 0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: DoubleCircularSlider(
                  100,
                  0,
                  100,
                  height: 260.0,
                  width: 260.0,
                  baseColor: const Color(0xFFF1F1F1),
                  selectionColor:
                      lightTheme.colorScheme.primary.withOpacity(0.5),
                  onSelectionChange: (int a, int b, int c) => _updateCounter(),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Center(
                        child: Stack(
                      children: [
                        Image.asset(
                          Assets.imagesSebha6,
                        ),
                        Positioned(
                            top: 50,
                            left: 100,
                            child: AutoSizeText(
                              "$counter",
                              style: lightTheme.textTheme.headlineSmall,
                            )),
                      ],
                    )),
                  ),
                )),
            30.heightXBox,
            GestureDetector(
                onTap: () => _resetCounter(),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: lightTheme.primaryColor.withOpacity(0.2),
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ))
          ],
        ));
  }

  void _resetCounter() {
    setState(() {
      counter = 0;
    });
  }
}
