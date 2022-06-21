import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String password;
  final int age;

  const UserEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.age,
  });

  @override
  List<Object> get props => [name, email, password, age];
}
