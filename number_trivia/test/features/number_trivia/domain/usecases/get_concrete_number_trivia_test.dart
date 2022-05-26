import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia_imp.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  group("Number trivia", () {
    late NumberTriviaRepository mockNumberTriviaRepository;
    late GetConcreteNumberTriviaImp getConcreteNumberTriviaImp;

    setUp(() {
      mockNumberTriviaRepository = MockNumberTriviaRepository();
      getConcreteNumberTriviaImp =
          GetConcreteNumberTriviaImp(mockNumberTriviaRepository);
    });

    test('should get trivia for the number from the repository', () async {
      const tNumberTrivia = NumberTrivia(number: 1, text: 'test');
      const tNumber = 1;

      when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
          .thenAnswer((_) async => tNumberTrivia);

      final result = await getConcreteNumberTriviaImp.call(tNumber);

      expect(result, tNumberTrivia);

      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));

      verifyNoMoreInteractions(mockNumberTriviaRepository);
    });
  });
}
