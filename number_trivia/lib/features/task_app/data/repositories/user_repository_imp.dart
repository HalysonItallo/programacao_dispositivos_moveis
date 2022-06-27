import 'package:task_app/core/error/exceptions.dart';
import 'package:task_app/core/network/networking_info.dart';
import 'package:task_app/features/task_app/data/datasources/local/user_local_datasource.dart';
import 'package:task_app/features/task_app/data/datasources/remote/user_remote_datasource.dart';
import 'package:task_app/features/task_app/data/models/user_model.dart';
import 'package:task_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:task_app/features/task_app/domain/repositories/user_repository.dart';

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
  Future<Either<Failure, void>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.logout();

        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> registerUser(UserModel user) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await remoteDataSource.registerUser(user);
        // localDataSource.cacheNumberTrivia(remoteTrivia as NumberTriviaModel);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
