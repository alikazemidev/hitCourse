import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class Ability {
  final String name;
   bool isSelected;

  Ability({required this.name, this.isSelected = false});
}

class _LoginScreenState extends State<LoginScreen> {
  bool isMale = true;
  List<Ability> abilities = [
    Ability(name: 'فلاتر'),
    Ability(name: 'ری اکت'),
    Ability(name: 'کاتلین'),
    Ability(name: 'جاوا اسکریپت'),
    Ability(name: 'هوش مصنوعی'),
    Ability(name: 'پایتون'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffbf2ff),
        body: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: const Color(0xffa41ddc),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 84,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      'ثبت نام در هیتال',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        InputText(
                          lable: "نام",
                          hintText: 'نام خانوداگی خود را وارد کنید.',
                        ),
                        SizedBox(height: 20),
                        InputText(
                          textInputType: TextInputType.number,
                          lable: "شماره موبایل",
                          hintText: 'شماره موبایل خود را وارد کنید.',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'جنسیت',
                          style: TextStyle(
                            color: Color(0xff00685e),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    isMale = true;
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'مرد',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: isMale ? Colors.blue : null,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    isMale = false;
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'زن',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: !isMale ? Colors.blue : null,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'توانایی ها',
                          style: TextStyle(
                            color: Color(0xff00685e),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Wrap(
                          runSpacing: 15,
                          spacing: 20,
                          children: List.generate(
                            abilities.length,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    abilities[index].isSelected =
                                        !abilities[index].isSelected;
                                  });
                                },
                                child: SizedBox(
                                  width: 110,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color:!abilities[index].isSelected ? Colors.white :Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: Colors.grey, width: 1),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(abilities[index].name),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minWidth: double.infinity,
                  height: 45,
                  color: Color(0xffa41ddc),
                  child: Text(
                    'ثبت نام',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InputText extends StatelessWidget {
  final String lable;
  final String hintText;
  final TextInputType? textInputType;
  const InputText({
    super.key,
    required this.lable,
    required this.hintText,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          lable,
          style: TextStyle(
            color: Color(0xff00685e),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            keyboardType: textInputType,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xff979797),
                )),
          ),
        )
      ],
    );
  }
}
