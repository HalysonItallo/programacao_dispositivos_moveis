import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/task_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:task_app/features/task_app/presentation/bloc/user_bloc/user_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void dispatchLogout() {
    BlocProvider.of<UserBloc>(context).add(
      const UserEvent.logout(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  dispatchLogout();
                },
                icon: const Icon(Icons.exit_to_app),
              )
            ],
          ),
          ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int i) {
              return const Text('Olá');
            },
            shrinkWrap: true,
          )
        ],
      ),
    );
  }
}
