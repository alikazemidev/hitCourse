import 'package:counter_hit/1ads_app/screens/main_page.dart';
import 'package:flutter/material.dart';

class AdsHomeScreen extends StatefulWidget {
  const AdsHomeScreen({super.key});

  @override
  State<AdsHomeScreen> createState() => _AdsHomeScreenState();
}

class _AdsHomeScreenState extends State<AdsHomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Color(0xff5c45db),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Image.asset('assets/images/logo.png',height: 80,),
              SizedBox(height: 30,),
              Text(
                'به اپ ما خوش آمدید',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xff9ee2ff),
            unselectedItemColor: Colors.white,
            currentIndex: _currentIndex,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'صفحه اصلی'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt), label: 'درخواست ها'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined), label: 'حساب کاربری'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.logout), label: 'خروج از حساب')
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            MainPageAdsApp(),
            Text('درخواست ها'),
            Text('حساب کاربری'),
            Text('خروج از حساب'),
          ],
        ),
      ),
    );
  }
}
