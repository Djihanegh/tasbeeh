import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app/style.dart';

class AdkarTopBar extends StatelessWidget {
  const AdkarTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          height: 140,
          width: constraints.maxWidth,
          decoration: BoxDecoration(
            borderRadius: appTopBarRadius,
            color: lightTheme.colorScheme.primary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: AutoSizeText(
                    'الاذكار',
                    style: lightTheme.primaryTextTheme.labelLarge!
                        .copyWith(fontSize: 25),
                  ))
            ],
          ));
    });
  }
}
