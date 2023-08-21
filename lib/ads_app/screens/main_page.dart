import 'package:flutter/material.dart';

class MainPageAdsApp extends StatelessWidget {
  const MainPageAdsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      color: Color(0xff6e5adf),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: 30,
                color: Colors.white,
              ),
            ),
            Text(
              'آگهی های هیتال',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.filter_alt_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Directionality(
                textDirection: TextDirection.ltr,
                child: Icon(
                  Icons.sort_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
