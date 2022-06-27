import 'package:task_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:task_app/core/usecases/usecase.dart';
import 'package:task_app/features/task_app/domain/repositories/user_repository.dart';

class LogoutImp extends UseCase<void, NoParams> {
  final UserRepository userRepository;

  LogoutImp({required this.userRepository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await userRepository.logout();
  }
}
