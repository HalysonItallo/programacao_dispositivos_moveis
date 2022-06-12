import 'package:freezed_annotation/freezed_annotation.dart';

part 'number_trivia_event.freezed.dart';

@freezed
class NumberTriviaEvent with _$NumberTriviaEvent {
  const factory NumberTriviaEvent.getTriviaForConcreteNumber(int numberString) =
      _GetTriviaForConcreteNumber;

  const factory NumberTriviaEvent.getTriviaForRandomNumber() =
      _GetTriviaForRandomNumber;
}
