import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/core/error/exceptions.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/core/platform/networking_info.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/local/number_trivia_local_data_source.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/remote/number_trivia_remote_data_source.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia/features/number_trivia/data/repositories/number_trivia_repository_imp.dart';

class MockRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {}

class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late NumberTriviaRepositoryImp numberTriviaRepositoryImp;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    numberTriviaRepositoryImp = NumberTriviaRepositoryImp(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  const tNumber = 1;
  const tNumberTriviaModel =
      NumberTriviaModel(number: tNumber, text: 'test trivia');
  const NumberTriviaModel tNumberTrivia = tNumberTriviaModel;

  group('getConcreteNumberTrivia', () {
    // DATA FOR THE MOCKS AND ASSERTIONS
    // We'll use these three variables throughout all the tests

    test('should check if the device is online', () {
      //arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      numberTriviaRepositoryImp.getConcreteNumberTrivia(tNumber);
      // assert
      verify(() => mockNetworkInfo.isConnected);
    });
  });

  group('device is online', () {
    // This setUp applies only to the 'device is online' group
    setUp(() {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // arrange
        when(() => mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
            .thenAnswer((_) async => tNumberTriviaModel);
        // act
        final result =
            await numberTriviaRepositoryImp.getConcreteNumberTrivia(tNumber);
        // assert
        verify(
          () => mockRemoteDataSource.getConcreteNumberTrivia(tNumber),
        );
        expect(
          result,
          equals(tNumberTrivia),
        );
      },
    );

    test(
      'should cache the data locally when the call to remote data source is successful',
      () async {
        // arrange
        when(() => mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
            .thenAnswer((_) async => tNumberTriviaModel);
        // act
        await numberTriviaRepositoryImp.getConcreteNumberTrivia(tNumber);
        // assert
        verify(() => mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
        verify(() => mockLocalDataSource.cacheNumberTrivia(tNumberTrivia));
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(() => mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
            .thenThrow(ServerException());
        // act
        final result =
            await numberTriviaRepositoryImp.getConcreteNumberTrivia(tNumber);
        // assert
        verify(() => mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(ServerFailure()));
      },
    );
  });
}
