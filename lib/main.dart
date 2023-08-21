import 'ads_app/ads_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa', 'IR'),
        Locale('en', 'US'),
      ],
      locale: Locale('fa', 'IR'),
      theme: ThemeData(
        fontFamily: 'samim',
      ),
      debugShowCheckedModeBanner: false,
      home: AdsHomeScreen(),
    );
  }
}
