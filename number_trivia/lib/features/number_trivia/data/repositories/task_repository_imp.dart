import 'package:number_trivia/core/error/exceptions.dart';
import 'package:number_trivia/core/network/networking_info.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/local/task_local_datasource.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/remote/task_remote_datasource.dart';
import 'package:number_trivia/features/number_trivia/data/models/task_model.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/task_repository.dart';

class TaskRepositoryImp extends TaskRepository {
  final TaskRemoteDataSource remoteDataSource;
  final TaskLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TaskRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, TaskModel>> addTask(TaskModel task) async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await remoteDataSource.addTask(task);

        return Right(remote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTask(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await remoteDataSource.deleteTask(id);
        return Right(remote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> getAllTasks() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await remoteDataSource.getAllTasks();
        // localDataSource.cacheNumberTrivia(remoteTrivia as NumberTriviaModel);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLastTasks();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
