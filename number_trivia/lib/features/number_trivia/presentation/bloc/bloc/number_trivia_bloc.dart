// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:number_trivia/core/error/failure.dart';
// import 'package:number_trivia/core/usecases/usecase.dart';

// import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc/bloc.dart';

// const String serverFailureMessage = 'Server Failure';
// const String cacheFailureMessage = 'Cache Failure';
// const String invalidInputFailureMessage =
//     'Invalid Input - The number must be a positive integer or zero.';

// class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
//   final GetConcreteNumberTriviaImp getConcreteNumberTrivia;
//   final GetRandomNumberTriviaImp getRandomNumberTrivia;

//   NumberTriviaBloc({
//     required this.getConcreteNumberTrivia,
//     required this.getRandomNumberTrivia,
//   }) : super(const NumberTriviaState.empty()) {
//     on<NumberTriviaEvent>(_onNumberTriviaEvent);
//   }

//   Future<void> _onNumberTriviaEvent(
//       NumberTriviaEvent event, Emitter<NumberTriviaState> emit) {
//     return event.when(
//       getTriviaForConcreteNumber: (integer) async {
//         emit(const NumberTriviaState.loading());

//         int value = integer;

//         final failureOrSuccess =
//             await getConcreteNumberTrivia(Params(number: value));

//         emit(
//           failureOrSuccess.fold(
//             (l) => NumberTriviaState.error(_mapFailureToMessage(l)),
//             (r) => NumberTriviaState.loaded(r),
//           ),
//         );
//       },
//       getTriviaForRandomNumber: () async {
//         emit(const NumberTriviaState.loading());

//         final failureOrSuccess = await getRandomNumberTrivia(NoParams());

//         emit(
//           failureOrSuccess.fold(
//             (l) => NumberTriviaState.error(_mapFailureToMessage(l)),
//             (r) => NumberTriviaState.loaded(r),
//           ),
//         );
//       },
//     );
//   }

//   String _mapFailureToMessage(Failure failure) {
//     switch (failure.runtimeType) {
//       case ServerFailure:
//         return serverFailureMessage;
//       case CacheFailure:
//         return cacheFailureMessage;
//       default:
//         return 'Unexpected error';
//     }
//   }
// }
