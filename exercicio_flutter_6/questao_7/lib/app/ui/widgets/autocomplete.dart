import 'package:flutter/material.dart';

class AutocompleteWidget extends StatelessWidget {
  final void Function(String)? onSelected;

  const AutocompleteWidget({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  static const List<String> _options = <String>[
    "Andy",
    "Aragon",
    "Bob",
    "Barbara",
    "Candy",
    "Colin",
    "Audra",
    "Banana",
    "Caversky",
    "Becky",
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _options.where(
          (String option) {
            return option.contains(
              textEditingValue.text.toLowerCase(),
            );
          },
        );
      },
      onSelected: onSelected,
    );
  }
}
