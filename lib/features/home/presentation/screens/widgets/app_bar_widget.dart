import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app/style.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                    AutoSizeText(
                      'الجزائر، عنابة',
                      style: lightTheme.primaryTextTheme.bodySmall,
                    )
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 20, top: 20),
                        child: AutoSizeText(
                          'متبقي على',
                          style: lightTheme.primaryTextTheme.bodySmall,
                        )),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 20, top: 5),
                      child: AutoSizeText(
                        'صلاة الظهر',
                        style: lightTheme.primaryTextTheme.labelLarge,
                      )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 5, top: 5),
                            child: AutoSizeText(
                              '15:20',
                              style: lightTheme.primaryTextTheme.labelLarge,
                            )),
                        Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: AutoSizeText(
                              'دقيقة',
                              style: lightTheme.primaryTextTheme.bodySmall,
                            )),
                      ])
                ],
              )
            ],
          ));
    });
  }
}
