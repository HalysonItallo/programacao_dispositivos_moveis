import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc/user_bloc.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc/user_state.dart';
import 'package:number_trivia/features/number_trivia/presentation/widgets/widgets.dart';
import 'package:number_trivia/injection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Trivia'),
      ),
      body: SingleChildScrollView(child: buildBody(context)),
    );
  }
}

BlocProvider<UserBloc> buildBody(BuildContext context) {
  return BlocProvider(
    create: (_) => sl<UserBloc>(),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            // Top half
            BlocBuilder<UserBloc, UserState>(
              builder: (BuildContext context, UserState state) {
                return Container(
                  child: state.maybeWhen(
                    loading: () => const LoadingWidget(),
                    logged: (user) {
                      return Text("$user");
                    },
                    loggedOut: (message) {
                      return Text(message);
                    },
                    orElse: () {
                      return null;
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const UserControls(),
          ],
        ),
      ),
    ),
  );
}
