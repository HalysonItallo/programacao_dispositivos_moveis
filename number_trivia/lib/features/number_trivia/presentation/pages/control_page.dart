import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc/user_bloc.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc/user_state.dart';
import 'package:number_trivia/features/number_trivia/presentation/pages/home/home_page.dart';
import 'package:number_trivia/features/number_trivia/presentation/pages/login/login_page.dart';
import 'package:number_trivia/features/number_trivia/presentation/pages/registerPage/register_page.dart';
import 'package:number_trivia/features/number_trivia/presentation/widgets/widgets.dart';
import 'package:number_trivia/injection.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildBody(context),
      ),
    );
  }
}

BlocProvider<UserBloc> buildBody(BuildContext context) {
  return BlocProvider(
    create: (_) => sl<UserBloc>(),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<UserBloc, UserState>(
            builder: (BuildContext context, UserState state) {
              return Container(
                child: state.maybeWhen(
                  loading: () => const LoadingWidget(),
                  logged: (user) {
                    return const HomePage();
                  },
                  loggedOut: (message) {
                    return LoginPage(
                      snackBarMenssage: message,
                    );
                  },
                  orElse: () {
                    return const LoginPage(
                      snackBarMenssage: '',
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
