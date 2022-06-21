import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/data/models/user_model.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/user_entity.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/user_repository.dart';

class RegisterUserImp extends UseCase<UserEntity, Params> {
  final UserRepository userRepository;

  RegisterUserImp({required this.userRepository});

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    return await userRepository.registerUser(params.user);
  }
}

class Params extends Equatable {
  final UserModel user;

  const Params({required this.user});

  @override
  List<Object?> get props => [user];
}
