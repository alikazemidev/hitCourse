class Student {
  String? name;
  String? description;
  int? age;
  int? grade;
  String? avatar;

  // Student({
  //   this.name,
  //   this.description,
  //   this.age,
  //   this.grade,
  //   this.avatar,
  //  });

  Student.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    description = json["description"];
    avatar = json["avatar"];
    age = json["age"];
    grade = json["grade"];
    ;
  }
}
