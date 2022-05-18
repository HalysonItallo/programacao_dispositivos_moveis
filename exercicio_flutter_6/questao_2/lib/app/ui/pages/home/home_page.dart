import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FocusNode _txtNode;

  @override
  void initState() {
    super.initState();
    _txtNode = FocusNode();
  }

  @override
  void dispose() {
    _txtNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Focus(
          focusNode: _txtNode,
          onKey: (focusNode, event) {
            if (event.toString().contains('RawKeyDownEvent') &&
                event.toString().contains('Enter')) {
              print("Aqui");
              focusNode.nextFocus();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                TextField(),
                TextField(),
                TextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
