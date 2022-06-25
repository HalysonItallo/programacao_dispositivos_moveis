import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/data/models/user_model.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/user_repository.dart';

class LoginImp extends UseCase<UserModel, LoginParams> {
  final UserRepository userRepository;

  LoginImp({required this.userRepository});

  @override
  Future<Either<Failure, UserModel>> call(LoginParams params) async {
    return await userRepository.login(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => throw UnimplementedError();
}
