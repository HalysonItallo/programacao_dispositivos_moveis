import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/features/task_app/domain/entities/user_entity.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.logged(UserEntity user) = _Logged;
  const factory UserState.loggedOut(String message) = _LoggedOut;
  const factory UserState.loading() = _Loading;
}
