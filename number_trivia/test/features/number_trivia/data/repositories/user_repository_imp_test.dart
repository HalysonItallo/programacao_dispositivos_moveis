import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_app/core/error/exceptions.dart';
import 'package:task_app/core/error/failure.dart';
import 'package:task_app/core/network/networking_info.dart';
import 'package:task_app/features/task_app/data/datasources/local/user_local_datasource.dart';
import 'package:task_app/features/task_app/data/datasources/remote/user_remote_datasource.dart';
import 'package:task_app/features/task_app/data/models/user_model.dart';
import 'package:task_app/features/task_app/data/repositories/user_repository_imp.dart';

class MockRemoteDataSource extends Mock implements UserRemoteDataSource {}

class MockLocalDataSource extends Mock implements UserLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late UserRepositoryImp repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUpAll(() {
    registerFallbackValue(
      const UserModel(
        age: 12,
        email: 'test.com',
        name: 'test',
        password: '1234',
      ),
    );
  });

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = UserRepositoryImp(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('login', () {
    const tUserModel = UserModel(
      age: 12,
      email: 'test.com',
      name: 'test',
      password: '1234',
    );

    test(
      'should check if the device is online',
      () async {
        // arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        verifyNever(() async => await repository.login("test.com", "1234"));
        final result = await mockNetworkInfo.isConnected;
        // assert
        expect(result, true);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(() => mockRemoteDataSource.registerUser(any()))
              .thenAnswer((_) async => tUserModel);
          // act
          final result = await repository.registerUser(tUserModel);
          // assert
          verify(() => mockRemoteDataSource.registerUser(tUserModel));
          expect(result, equals(const Right(tUserModel)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(() => mockRemoteDataSource.registerUser(any()))
              .thenAnswer((_) async => tUserModel);
          // act
          await repository.registerUser(tUserModel);
          // assert
          verify(() => mockRemoteDataSource.registerUser(tUserModel));
          verify(() => mockLocalDataSource.cacheUser(tUserModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(() => mockRemoteDataSource.registerUser(any()))
              .thenThrow(ServerException());
          // act
          final result = await repository.registerUser(tUserModel);
          // assert
          verify(() => mockRemoteDataSource.registerUser(tUserModel));
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cached data is present',
        () async {
          // arrange
          when(() => mockLocalDataSource.getLastUser())
              .thenAnswer((_) async => tUserModel);
          // act
          final result = await repository.registerUser(tUserModel);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(() => mockLocalDataSource.getLastUser());
          expect(result, equals(const Right(tUserModel)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange
          when(() => mockLocalDataSource.getLastUser())
              .thenThrow(CacheException());
          // act
          final result = await repository.registerUser(tUserModel);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(() => mockLocalDataSource.getLastUser());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
