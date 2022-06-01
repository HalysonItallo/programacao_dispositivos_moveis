import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia/get_random_number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/usecase.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  group("Get Random Number Trivia Tests: ", () {
    late MockNumberTriviaRepository mockNumberTriviaRepository;
    late GetRandomNumberTrivia getRandomNumberTrivia;

    setUp(() {
      mockNumberTriviaRepository = MockNumberTriviaRepository();
      getRandomNumberTrivia = GetRandomNumberTrivia(
        numberTriviaRepository: mockNumberTriviaRepository,
      );
    });

    test(
      'should get trivia from the repository',
      () async {
        const tNumberTrivia = NumberTrivia(number: 1, text: 'test');

        when(
          () => mockNumberTriviaRepository.getRandomNumberTrivia(),
        ).thenAnswer((_) async => right(tNumberTrivia));
        // act
        // Since random number doesn't require any parameters, we pass in NoParams.
        final result = await getRandomNumberTrivia(NoParams());
        // assert
        expect(result, right(tNumberTrivia));
        verify(() => mockNumberTriviaRepository.getRandomNumberTrivia());
        verifyNoMoreInteractions(mockNumberTriviaRepository);
      },
    );
  });
}
