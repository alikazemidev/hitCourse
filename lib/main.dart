
import 'package:counter_hit/note_app/models/note.dart';
import 'package:counter_hit/state_managment_apps/counter_app_get/home_page_counter_get.dart';

// import 'package:counter_hit/student_app/home_page_student_app.dart';
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
        // useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePageCounterGet(),
    );
  }
}
