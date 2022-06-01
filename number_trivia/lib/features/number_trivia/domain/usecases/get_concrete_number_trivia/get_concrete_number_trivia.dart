import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/usecase.dart';

import '../../repositories/number_trivia_repository.dart';

class GetConcreteNumberTriviaImp extends UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository numberTriviaRepository;
  GetConcreteNumberTriviaImp({required this.numberTriviaRepository});

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await numberTriviaRepository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  const Params({required this.number});

  @override
  List<Object?> get props => [number];
}
