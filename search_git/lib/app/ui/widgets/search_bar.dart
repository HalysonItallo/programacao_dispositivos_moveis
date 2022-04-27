import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final void Function(String)? onSubmitted;
  const SearchBar({
    Key? key,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        decoration: const InputDecoration(
            labelText: "Encontre seus gifs!",
            labelStyle: TextStyle(
              color: Color.fromRGBO(238, 108, 77, 1),
            ),
            border: OutlineInputBorder()),
        style: const TextStyle(
            color: Color.fromRGBO(224, 251, 252, 1), fontSize: 18),
        textAlign: TextAlign.center,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
