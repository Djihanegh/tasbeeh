import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tasbeeh/core/extension/sized_box_extension.dart';

import '../../../../../core/app/style.dart';

class PrayerTimesWidget extends StatelessWidget {
  const PrayerTimesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 40,
          ),
          child: Container(
            // height: 260,
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              color: lightTheme.colorScheme.primaryContainer,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: lightTheme.colorScheme.primary,
                  ),
                  child: Row(
                    children: [
                      10.widthXBox,
                      const Icon(
                        Icons.mosque,
                        color: Colors.white,
                      ),
                      10.widthXBox,
                      AutoSizeText(
                        'مواعيد الصلاة',
                        style: lightTheme.primaryTextTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                10.heightXBox,
                for (var prayer in prayerTimes.entries)
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            prayer.key,
                            style: lightTheme.textTheme
                                .apply(displayColor: Colors.black)
                                .bodyMedium,
                          ),
                          AutoSizeText(
                            prayer.value,
                            style: lightTheme.textTheme
                                .apply(displayColor: Colors.black)
                                .bodyMedium,
                          )
                        ],
                      )),
                20.heightXBox,
              ],
            ),
          ));
    });
  }
}

Map<String, dynamic> prayerTimes = {
  "الفجْر": "5:25 ص",
  "الشروق": "7:02 ص",
  "صلاة الظُّهْر": "12:13 م",
  "صلاة العَصر": "3:02 م",
  "صلاة المَغرب": "5:24 م",
  "صلاة العِشاء": "6:50 م"
};
