import 'package:counter_hit/api_app/models/student.dart';
import 'package:counter_hit/student_app/add_student.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageStuddentApp extends StatefulWidget {
  const HomePageStuddentApp({super.key});

  @override
  State<HomePageStuddentApp> createState() => _HomePageStuddentAppState();
}

class _HomePageStuddentAppState extends State<HomePageStuddentApp> {
  List<Student>? studetns;

  Future<void> getData() async {
    var response = await Dio().get('https://hitaldev.ir/api/students');
    studetns = [];
    for (var student in response.data["data"]) {
      studetns!.add(Student.fromJson(student));
    }
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
      body: SafeArea(
        child: studetns == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: studetns!.length,
                itemBuilder: (BuildContext context, int index) {
                  return StudentCard(
                    myStudent: studetns!,
                    myIndex: index,
                  );
                },
              ),
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  final List<Student> myStudent;
  final int myIndex;
  const StudentCard({
    super.key,
    required this.myStudent,
    required this.myIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
            child: myStudent[myIndex].avatar == null
                ? Image.asset('assets/images/images.jpg')
                : Image.network(
                    myStudent[myIndex].avatar!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  myStudent[myIndex].name!,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Text(
                  myStudent[myIndex].age!.toString(),
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
    );
  }
}
