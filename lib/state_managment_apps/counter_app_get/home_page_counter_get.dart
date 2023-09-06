import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageCounterGet extends StatefulWidget {
  HomePageCounterGet({super.key});

  @override
  State<HomePageCounterGet> createState() => _HomePageCounterGetState();
}

class _HomePageCounterGetState extends State<HomePageCounterGet> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'counter app',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            count++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          minimumSize: Size(50, 50),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 40,
                        ),
                      ),
                      Text(
                        count.toString(),
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (count == 0) {
                              return;
                            }
                            count--;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          minimumSize: Size(50, 50),
                        ),
                        child: Icon(
                          CupertinoIcons.minus,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('go second page'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
