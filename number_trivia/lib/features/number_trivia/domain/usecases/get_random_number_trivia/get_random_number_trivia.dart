import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/usecase.dart';

class GetRandomNumberTrivia extends UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository numberTriviaRepository;

  GetRandomNumberTrivia({required this.numberTriviaRepository});

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await numberTriviaRepository.getRandomNumberTrivia();
  }
}
