import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'models/student.dart';

class HomePageApiApp extends StatefulWidget {
  const HomePageApiApp({super.key});

  @override
  State<HomePageApiApp> createState() => _HomePageApiAppState();
}

class _HomePageApiAppState extends State<HomePageApiApp> {
  Student? student;


  Future<void> getData() async {
    var response = await Dio().get("https://hitaldev.ir/api/students/1");
    student = Student.fromJson(response.data);
    print(response.data);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade600,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Api app',
          style: TextStyle(fontSize: 14),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(25),
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.white,
                width: 4,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/images.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              Text('name'),
              Text('abilities'),
              Text('description'),
            ],
          ),
        ),
      ),
    );
  }
}
