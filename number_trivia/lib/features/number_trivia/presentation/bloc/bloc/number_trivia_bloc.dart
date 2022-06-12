import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/core/util/input_convert.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia/get_concrete_number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia/get_random_number_trivia.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc/bloc.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';
const String invalidInputFailureMessage =
    'Invalid Input - The number must be a positive integer or zero.';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTriviaImp getConcreteNumberTrivia;
  final GetRandomNumberTriviaImp getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc({
    required this.getConcreteNumberTrivia,
    required this.getRandomNumberTrivia,
    required this.inputConverter,
  }) : super(const NumberTriviaState.empty()) {
    on<NumberTriviaEvent>(_onNumberTriviaEvent);
  }

  Future<void> _onNumberTriviaEvent(
      NumberTriviaEvent event, Emitter<NumberTriviaState> emit) {
    return event.when(
      getTriviaForConcreteNumber: (integer) async {
        emit(const NumberTriviaState.loading());

        int value = integer;

        final failureOrSuccess =
            await getConcreteNumberTrivia(Params(number: value));

        emit(
          failureOrSuccess.fold(
            (l) => NumberTriviaState.error(_mapFailureToMessage(l)),
            (r) => NumberTriviaState.loaded(r),
          ),
        );
      },
      getTriviaForRandomNumber: () async {
        emit(const NumberTriviaState.loading());

        final failureOrSuccess = await getRandomNumberTrivia(NoParams());

        emit(
          failureOrSuccess.fold(
            (l) => NumberTriviaState.error(_mapFailureToMessage(l)),
            (r) => NumberTriviaState.loaded(r),
          ),
        );
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return 'Unexpected error';
    }
  }
}
