import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/task_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:task_app/features/task_app/presentation/bloc/user_bloc/user_event.dart';

class UserControls extends StatefulWidget {
  const UserControls({Key? key}) : super(key: key);

  @override
  UserControlsState createState() => UserControlsState();
}

class UserControlsState extends State<UserControls> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
      onPressed: dispatchLogin,
      child: const Text('Login'),
    );
  }

  void dispatchLogin() {
    BlocProvider.of<UserBloc>(context).add(
      const UserEvent.login(
        "muh.nurali43@gmail.com",
        "12345678",
      ),
    );
  }
}
