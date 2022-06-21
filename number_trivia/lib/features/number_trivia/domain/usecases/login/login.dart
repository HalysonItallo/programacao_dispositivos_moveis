import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/user_entity.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/user_repository.dart';

class LoginImp extends UseCase<UserEntity, Params> {
  final UserRepository userRepository;

  LoginImp({required this.userRepository});

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    return await userRepository.login(params.email, params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  const Params({required this.email, required this.password});

  @override
  List<Object?> get props => throw UnimplementedError();
}
