import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/features/number_trivia/data/models/user_model.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc/user_bloc.dart';

import '../../bloc/bloc/user_event.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void dispatchRegisterUser() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                    offset: const Offset(0, 3), // changes position of shadow
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
                      decoration:
                          const InputDecoration(labelText: "Digite seu nome."),
                    ),
                    TextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(labelText: "Qual a sua idade?"),
                    ),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      decoration:
                          const InputDecoration(labelText: "Digite seu E-mail"),
                    ),
                    TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      decoration:
                          const InputDecoration(labelText: "Digite sua Senha"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                      ),
                      child: const Text("Cadastrar"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
