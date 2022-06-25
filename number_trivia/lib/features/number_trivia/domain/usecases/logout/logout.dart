import 'package:number_trivia/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/user_repository.dart';

class LogoutImp extends UseCase<void, NoParams> {
  final UserRepository userRepository;

  LogoutImp({required this.userRepository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await userRepository.logout();
  }
}
