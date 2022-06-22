import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc/user_bloc.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc/user_event.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void dispatchLogin() {
      BlocProvider.of<UserBloc>(context).add(
        UserEvent.login(
          emailController.text,
          passwordController.text,
        ),
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(89, 101, 111, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: "E-mail"),
                ),
                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: "Senha"),
                ),
                ElevatedButton(
                  onPressed: dispatchLogin,
                  child: const Text("Entrar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
