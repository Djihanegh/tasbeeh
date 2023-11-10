import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tasbeeh/core/extension/sized_box_extension.dart';

import '../../../../../core/app/style.dart';

class NamesOfAllahWidget extends StatelessWidget {
  const NamesOfAllahWidget({super.key});

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
                          'اسماء الله الحسنى',
                          style: lightTheme.primaryTextTheme.bodySmall!
                              .copyWith(color: lightTheme.colorScheme.primary),
                        ),
                        10.heightXBox,
                        AutoSizeText('الرحمنِ',
                            style: lightTheme.textTheme
                                .apply(
                                    displayColor: Color(0xFFf4dcd4),
                                    bodyColor: Color(0xFFde7a4c))
                                .bodyLarge),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AutoSizeText('اقرا المزيد',
                                style: lightTheme.textTheme
                                    .apply(displayColor: Colors.black)
                                    .bodySmall),
                          const  Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.black,
                            )
                          ],
                        )
                      ]))));
    });
  }
}
