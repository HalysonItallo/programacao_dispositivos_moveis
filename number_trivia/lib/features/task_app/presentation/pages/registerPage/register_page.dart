import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/task_app/data/models/user_model.dart';
import 'package:task_app/features/task_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:task_app/features/task_app/presentation/bloc/user_bloc/user_state.dart';
import 'package:task_app/features/task_app/presentation/pages/home/home_page.dart';
import 'package:task_app/features/task_app/presentation/pages/login/login_page.dart';
import 'package:task_app/features/task_app/presentation/widgets/loading_widget.dart';
import 'package:task_app/injection.dart';

import '../../bloc/user_bloc/user_event.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController nameController = TextEditingController();

final _formKey = GlobalKey<FormState>();

void dispatchRegisterUser(context) {
  BlocProvider.of<UserBloc>(context).add(
    UserEvent.registerUser(
      UserModel(
          name: nameController.text,
          email: emailController.text,
          age: int.parse(ageController.text),
          password: passwordController.text),
    ),
  );
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody(context));
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
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(89, 101, 111, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextField(
                                    controller: nameController,
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                        labelText: "Digite seu nome."),
                                  ),
                                  TextField(
                                    controller: ageController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        labelText: "Qual a sua idade?"),
                                  ),
                                  TextField(
                                    controller: emailController,
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                        labelText: "Digite seu E-mail"),
                                  ),
                                  TextField(
                                    controller: passwordController,
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                        labelText: "Digite sua Senha"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      dispatchRegisterUser(context);
                                      if (message != '') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              message,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blueAccent),
                                    ),
                                    child: const Text("Cadastrar"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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
