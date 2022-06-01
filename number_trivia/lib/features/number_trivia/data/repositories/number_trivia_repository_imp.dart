import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/exceptions.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/core/platform/networking_info.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/local/number_trivia_local_data_source.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/remote/number_trivia_remote_data_source.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'dart:async';

import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImp implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    networkInfo.isConnected;
    try {
      final remoteTrivia =
          await remoteDataSource.getConcreteNumberTrivia(number);
      localDataSource.cacheNumberTrivia(remoteTrivia);
      return right(remoteTrivia);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    throw UnimplementedError();
  }
}
