import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia_entity.dart';

part 'number_trivia_state.freezed.dart';

@freezed
class NumberTriviaState with _$NumberTriviaState {
  const factory NumberTriviaState.empty() = _Empty;
  const factory NumberTriviaState.loading() = _Loading;
  const factory NumberTriviaState.loaded(NumberTrivia trivia) = _Loaded;
  const factory NumberTriviaState.error(String message) = _Error;
}
