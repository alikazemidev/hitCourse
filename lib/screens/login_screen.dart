import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                          height: 8,
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
