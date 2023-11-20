import 'package:flutter/material.dart';

import '../../../../core/ui/ui_export.dart';
import '../../../../core/ui/custom_top_bar.dart';

class AdkarScreen extends StatefulWidget {
  const AdkarScreen({super.key});

  @override
  State<AdkarScreen> createState() => _AdkarScreenState();
}

class _AdkarScreenState extends State<AdkarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTopBar(
              title: 'الاذكار',
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ReadMoreContainer(
                        topPadding: 15,
                        title: 'أذكار الصباح',
                        content:
                            "أَصْـبَحْنا وَأَصْـبَحَ المُـلْكُ لله وَالحَمدُ لله ، لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ، لهُ المُـلكُ ولهُ الحَمْـد، وهُوَ على كلّ شَيءٍ قدير",
                        key: Key('adkar'),
                      );
                    })),
          ]);
    }));
  }
}
