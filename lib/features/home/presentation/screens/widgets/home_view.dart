import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tasbeeh/core/app/style.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              color: lightTheme.colorScheme.secondary,
              height: 100,
              width: constraints.maxWidth,

              // decoration: BoxDecoration(borderRadius: BorderRadius.c),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'متبقي على صلاة الظهر',
                    style: lightTheme.primaryTextTheme.displayMedium,
                  )
                ],
              ))
        ],
      ));
    });
  }
}
