import 'package:number_trivia/core/error/exceptions.dart';
import 'package:number_trivia/core/network/networking_info.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/local/user_local_datasource.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/remote/user_remote_datasource.dart';
import 'package:number_trivia/features/number_trivia/data/models/user_model.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImp({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserModel>> login(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await remoteDataSource.login(email, password);
        // localDataSource.cacheNumberTrivia(remoteTrivia as NumberTriviaModel);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLastUser();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, UserModel>> logout(String token) {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> registerUser(UserModel user) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
