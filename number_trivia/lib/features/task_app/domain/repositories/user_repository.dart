import 'package:dartz/dartz.dart';
import 'package:task_app/core/error/failure.dart';
import 'package:task_app/features/task_app/data/models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> registerUser(UserModel user);
  Future<Either<Failure, UserModel>> login(String email, String password);
  Future<Either<Failure, void>> logout();
}
