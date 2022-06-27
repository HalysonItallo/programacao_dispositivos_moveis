import 'package:task_app/features/task_app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    String? id,
    required String name,
    required String email,
    String? password,
    required int age,
  }) : super(name: name, email: email, password: password, age: age, id: id);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      age: json['age'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'age': age,
      'id': id
    };
  }
}
