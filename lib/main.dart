import 'package:counter_hit/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'samim',
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}


