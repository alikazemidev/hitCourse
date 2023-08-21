import 'package:counter_hit/ads_app/screens/main_page.dart';
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
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
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
