import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/features/number_trivia/data/models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> registerUser(UserModel user);
  Future<Either<Failure, UserModel>> login(String email, String password);
  Future<Either<Failure, void>> logout();
}
