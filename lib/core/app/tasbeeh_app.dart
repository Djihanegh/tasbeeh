import 'package:flutter/material.dart';
import 'package:tasbeeh/core/app/style.dart';

import '../navigation/router.dart';

class TasbeehApp extends StatelessWidget {
  const TasbeehApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,

    );
  }
}
