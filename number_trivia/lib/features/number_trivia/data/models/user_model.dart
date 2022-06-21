import 'package:number_trivia/features/number_trivia/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String name,
    required String email,
    required String password,
    required int age,
  }) : super(name: name, email: email, password: password, age: age);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        age: json['age']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'password': password, 'age': age};
  }
}
