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
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
                  backgroundColor: Color(0xff5c45db),
                  context: context,
                  builder: (context) {
                    return FiltterBottomSheet();
                  },
                );
              },
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

class FiltterBottomSheet extends StatelessWidget {
  final List<String> abilities = ['فلاتر', 'ری اکت', 'جاوا اسکریپت', 'پایتون'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'مهارت مورد نظر خود را انتخاب کنید:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(abilities.length, (index) {
              return Container(
                margin: EdgeInsets.only(bottom:10 ),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    abilities[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
