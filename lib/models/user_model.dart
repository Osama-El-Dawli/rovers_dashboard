class UserModel {
  final String name;
  final String phone;
  final int grade;
  final String sex;
  final String? hobbies;
  final bool isSaved;

  new({
    required this.name,
    required this.phone,
    required this.grade,
    required this.sex,
    required this.hobbies,
    required this.isSaved,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json['name'],
    phone: json['phone'],
    grade: json['grade'],
    sex: json['sex'],
    hobbies: json['hobbies'],
    isSaved: json['isSaved'],
  );
}
