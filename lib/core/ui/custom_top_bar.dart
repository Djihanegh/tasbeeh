import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../app/style.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({super.key, required this.title});

  final String title;

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
                    title,
                    style: lightTheme.primaryTextTheme.labelLarge!
                        .copyWith(fontSize: 25),
                  ))
            ],
          ));
    });
  }
}
