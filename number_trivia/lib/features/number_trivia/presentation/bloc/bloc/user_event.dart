import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:number_trivia/features/number_trivia/data/models/user_model.dart';

part 'user_event.freezed.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.login(String email, String password) = _Login;

  const factory UserEvent.logout() = _Logout;

  const factory UserEvent.registerUser(UserModel user) = _RegisterUser;
}
