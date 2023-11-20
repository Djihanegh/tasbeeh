import 'package:flutter/material.dart';
import 'package:tasbeeh/core/ui/read_more_container.dart';
import 'widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return const SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeTopBar(),
          PrayerTimesWidget(),
          DuaaWidget(),
          ReadMoreContainer(
            title: 'اسماء الله الحسنى',
            content: 'الرحمنِ',
            key: Key('names-of-allah'),
          )
          //  NamesOfAllahWidget()
        ],
      ));
    });
  }
}
