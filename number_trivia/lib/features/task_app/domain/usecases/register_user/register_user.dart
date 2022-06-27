import 'package:equatable/equatable.dart';
import 'package:task_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:task_app/core/usecases/usecase.dart';
import 'package:task_app/features/task_app/data/models/user_model.dart';
import 'package:task_app/features/task_app/domain/entities/user_entity.dart';
import 'package:task_app/features/task_app/domain/repositories/user_repository.dart';

class RegisterUserImp extends UseCase<UserEntity, RegisterUserParams> {
  final UserRepository userRepository;

  RegisterUserImp({required this.userRepository});

  @override
  Future<Either<Failure, UserEntity>> call(RegisterUserParams params) async {
    return await userRepository.registerUser(params.user);
  }
}

class RegisterUserParams extends Equatable {
  final UserModel user;

  const RegisterUserParams({required this.user});

  @override
  List<Object?> get props => [user];
}
