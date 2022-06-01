import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:number_trivia/features/number_trivia/data/repositories/number_trivia_repository_imp.dart';

import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia/get_concrete_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepositoryImp {}

void main() {
  group("Get Concrete Number Trivia Tests: ", () {
    late NumberTriviaRepository mockNumberTriviaRepository;
    late GetConcreteNumberTriviaImp getConcreteNumberTriviaImp;

    setUp(() {
      mockNumberTriviaRepository = MockNumberTriviaRepository();
      getConcreteNumberTriviaImp = GetConcreteNumberTriviaImp(
        numberTriviaRepository: mockNumberTriviaRepository,
      );
    });

    test('should get trivia for the number from the repository', () async {
      const tNumberTrivia = NumberTrivia(number: 1, text: 'test');
      const tNumber = 1;

      when(
        () => mockNumberTriviaRepository.getConcreteNumberTrivia(any()),
      ).thenAnswer((_) async => right(tNumberTrivia));

      final result = await getConcreteNumberTriviaImp.call(
        const Params(number: tNumber),
      );

      expect(result, right(tNumberTrivia));

      verify(() => mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));

      verifyNoMoreInteractions(mockNumberTriviaRepository);
    });
  });
}
