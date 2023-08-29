import 'package:counter_hit/student_app/add_student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageStuddentApp extends StatefulWidget {
  const HomePageStuddentApp({super.key});

  @override
  State<HomePageStuddentApp> createState() => _HomePageStuddentAppState();
}

class _HomePageStuddentAppState extends State<HomePageStuddentApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade500,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddStudentPage(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal.shade500,
        title: Text(
          'لیست دانش آموزان',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(30),
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/images.jpg',
                width: 80,
                height: 80,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'نام : علی کاظمی',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'سن : ۳۰',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        CupertinoIcons.pencil,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.delete,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
