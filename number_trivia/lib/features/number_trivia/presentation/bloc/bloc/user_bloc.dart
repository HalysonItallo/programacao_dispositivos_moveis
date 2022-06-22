import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/login/login.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/logout/logout.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/register_user/register_user.dart';

import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LoginImp loginImp;
  final LogoutImp logoutImp;
  final RegisterUserImp registerUserImp;

  UserBloc({
    required this.loginImp,
    required this.logoutImp,
    required this.registerUserImp,
  }) : super(const UserState.loggedOut('')) {
    on<UserEvent>(_onUserEvent);
  }

  Future<void> _onUserEvent(UserEvent event, Emitter<UserState> emit) {
    return event.when(
      login: (email, password) async {
        emit(const UserState.loading());

        final failureOrSuccess = await loginImp(
          LoginParams(email: email, password: password),
        );

        emit(
          failureOrSuccess.fold(
            (l) => const UserState.loggedOut("Verifique seu e-mail ou senha"),
            (r) => UserState.logged(r),
          ),
        );
      },
      logout: (token) async {},
      registerUser: (user) async {
        emit(const UserState.loading());

        final failureOrSuccess = await registerUserImp(
          RegisterUserParams(user: user),
        );

        emit(
          failureOrSuccess.fold(
            (l) => const UserState.loggedOut("Ops, estamos com problemas !!!"),
            (r) =>
                const UserState.loggedOut("Usuário cadastrado com sucesso !!!"),
          ),
        );
      },
    );
  }
}
