import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:task_app/core/usecases/usecase.dart';
import 'package:task_app/features/task_app/data/models/user_model.dart';
import 'package:task_app/features/task_app/domain/usecases/login/login.dart';
import 'package:task_app/features/task_app/domain/usecases/logout/logout.dart';
import 'package:task_app/features/task_app/domain/usecases/register_user/register_user.dart';
import 'package:task_app/features/task_app/presentation/bloc/bloc.dart';

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
      logout: () async {
        emit(const UserState.loading());

        final failureOrSuccess = await logoutImp(NoParams());

        emit(
          failureOrSuccess.fold(
            (l) => const UserState.logged(
              UserModel(
                age: 0,
                id: '',
                email: '',
                name: '',
                password: '',
              ),
            ),
            (r) => const UserState.loggedOut("Deslogado com sucesso !!!"),
          ),
        );
      },
      registerUser: (user) async {
        emit(const UserState.loading());

        final failureOrSuccess = await registerUserImp(
          RegisterUserParams(user: user),
        );

        emit(
          failureOrSuccess.fold(
            (l) => const UserState.loggedOut("Verifique seus campos"),
            (r) => UserState.logged(r),
          ),
        );
      },
    );
  }
}
