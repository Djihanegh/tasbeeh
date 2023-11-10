import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tasbeeh/core/extension/sized_box_extension.dart';

import '../../../../../core/app/style.dart';

class DuaaWidget extends StatelessWidget {
  const DuaaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 30,
          ),
          child: Container(
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                color: lightTheme.colorScheme.primaryContainer.withOpacity(0.1),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'دعاء اليوم',
                          style: lightTheme.primaryTextTheme.bodySmall!
                              .copyWith(color: lightTheme.colorScheme.primary),
                        ),
                        10.heightXBox,
                        AutoSizeText(
                            'اللهم إني أعوذُ بكَ منَ الهمِّ والحزَنِ، وأعوذُ بكَ منَ العجزِ والكسلِ، وأعوذُ بكَ منَ الجُبنِ والبخلِ ؛ وأعوذُ بكَ مِن غلبةِ الدَّينِ وقهرِ الرجالِ',
                            style: lightTheme.textTheme
                                .apply(displayColor: Colors.black)
                                .bodyMedium)
                      ]))));
    });
  }
}
