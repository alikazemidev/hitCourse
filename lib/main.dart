import 'package:counter_hit/api_app/home_page_api_app.dart';
import 'package:counter_hit/note_app/models/note.dart';
import 'package:counter_hit/note_app/note_app_home_screen.dart';
import 'package:counter_hit/student_app/home_page_student_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('noteBox');
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
      home: HomePageStuddentApp(),
    );
  }
}
