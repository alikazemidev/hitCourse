import 'dart:io';

import 'package:counter_hit/api_app/models/student.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class AddStudentPage extends StatefulWidget {
  final Function onCreated;
  final int? id;
  AddStudentPage({
    super.key,
    required this.onCreated,
    this.id,
  });

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  XFile? avatar;
  Student? student;
  final formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  bool isLoading = false;

  Future<void> selectImage() async {
    avatar = await picker.pickImage(source: ImageSource.gallery);
    print(avatar);
    setState(() {});
  }

  Future<void> getStudentDetails() async {
    setState(() {
      isLoading = true;
    });
    var res = await Dio().get('https://hitaldev.ir/api/students/${widget.id}');
    setState(() {
      isLoading = false;
    });
    student = Student.fromJson(res.data["data"]);
    nameController.text = student?.name ?? '';
    ageController.text = student?.age.toString() ?? "";
    descController.text = student?.description ?? "";
    setState(() {});
  }

  @override
  void initState() {
    if (widget.id != null) {
      getStudentDetails();
    }
    super.initState();
  }

  Future<void> createOrUpdateStudent() async {
    var formData = FormData();
    var response;
    formData.fields.add(MapEntry('name', nameController.text));
    formData.fields.add(MapEntry('age', ageController.text));
    formData.fields.add(MapEntry('description', descController.text));
    if (avatar != null) {
      formData.files
          .add(MapEntry('avatar', MultipartFile.fromFileSync(avatar!.path)));
    }
    setState(() {
      isLoading = true;
    });
    if (widget.id != null) {
      response = await Dio().post(
        'https://hitaldev.ir/api/students/${widget.id}',
        data: formData,
      );
    } else {
      response = await Dio().post(
        'https://hitaldev.ir/api/students',
        data: formData,
      );
    }
    setState(() {
      isLoading = false;
    });
    widget.onCreated();
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal.shade500,
        title: Text(
          widget.id == null ? 'افزودن دانش آموز' : 'ویرایش دانش آموز',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "نام را وارد کنید";
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none,
                          hintText: 'نام و نام خانوادگی',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "سن را وارد کنید";
                          }
                          return null;
                        },
                        controller: ageController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none,
                          hintText: 'سن',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        maxLines: 5,
                        controller: descController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none,
                          hintText: 'توضیحات',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          selectImage();
                        },
                        child: Text(
                          'عکس پروفایل',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      avatar == null
                          ? Container()
                          : Center(
                              child: Image.file(
                                File(avatar!.path),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                      widget.id != null && avatar == null
                          ? Center(
                              child: Image.network(
                                student!.avatar!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            disabledBackgroundColor: Colors.teal.shade200,
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: Colors.teal.shade500,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        onPressed: !isLoading
                            ? () {
                                if (formKey.currentState!.validate()) {
                                  createOrUpdateStudent()
                                      .then((value) => Navigator.pop(context));
                                }
                              }
                            : null,
                        child: isLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Text(
                                widget.id == null
                                    ? 'افزودن دانش آموز'
                                    : 'ویرایش دانش آموز',
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
