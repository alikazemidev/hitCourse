import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPageAdsApp extends StatelessWidget {
  const MainPageAdsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                PopupMenuButton(
                  position: PopupMenuPosition.under,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  color: Color(0xff5c45db),
                  onOpened: () {},
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'جدیدترین',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                      PopupMenuItem(
                          child: Center(
                        child: Text(
                          'پربازدیدترین',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                    ];
                  },
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
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 180,
            // color: Colors.grey.shade100,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(left: 12),
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff009cdf),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //  badge
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            // margin: EdgeInsets.all(12),
                            padding: EdgeInsets.fromLTRB(15, 1, 15, 0),
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color(0xff009cdf),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'حضوری',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'مهارت ها : ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'تسلط به زبان دارت و فریم ورک فلاتر',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'حقوق پیشنهادی : ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '۲۰ تا ۳۰ میلیون ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0xff009cdf),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            CupertinoIcons.delete,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //  title
                Container(
                  margin: EdgeInsets.only(right: 30),
                  padding: EdgeInsets.fromLTRB(18, 1, 18, 0),
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xff5c45db),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                  child: Text(
                    'برنامه نویس فلاتر',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // moshahede
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xff5c45db),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(4),
                        topLeft: Radius.circular(4),
                      ),
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'مشاهده',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
                margin: EdgeInsets.only(bottom: 10),
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
