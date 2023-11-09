import 'package:flutter/material.dart';
import 'package:tasbeeh/core/app/style.dart';

import '../../localization.dart';
import '../navigation/router.dart';

class TasbeehApp extends StatelessWidget {
  const TasbeehApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
     supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates:
      AppLocalizations.localizationsDelegates,
      locale: const Locale('ar'),
      title: '',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,

    );
  }
}
