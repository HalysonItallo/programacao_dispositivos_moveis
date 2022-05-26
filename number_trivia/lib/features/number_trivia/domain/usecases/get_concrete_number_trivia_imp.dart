import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia_usecase.dart';

import '../repositories/number_trivia_repository.dart';

class GetConcreteNumberTriviaImp implements GetConcreteNumberTriviaUsecase {
  final NumberTriviaRepository repository;
  GetConcreteNumberTriviaImp(this.repository);

  @override
  Future<dynamic> call(int number) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
