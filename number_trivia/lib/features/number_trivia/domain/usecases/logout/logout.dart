import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/user_entity.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/user_repository.dart';

class LogoutImp extends UseCase<UserEntity, Params> {
  final UserRepository userRepository;

  LogoutImp({required this.userRepository});

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    return await userRepository.logout(params.token);
  }
}

class Params extends Equatable {
  final String token;

  const Params({required this.token});

  @override
  List<Object?> get props => [token];
}
