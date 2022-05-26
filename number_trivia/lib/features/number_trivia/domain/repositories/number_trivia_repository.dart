abstract class NumberTriviaRepository {
  Future<dynamic> getConcreteNumberTrivia(int number);
  Future<dynamic> getRandomNumberTrivia();
}
