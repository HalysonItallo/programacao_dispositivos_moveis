import 'package:flutter/material.dart';

class AutocompleteWidget extends StatelessWidget {
  final void Function(String)? onSelected;

  const AutocompleteWidget({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  static const List<String> _options = <String>[
    'quidem molestiae enim',
    'sunt qui excepturi placeat culpa',
    'omnis laborum odio',
    'non esse culpa molestiae omnis sed optio',
    'eaque aut omnis a',
    'natus impedit quibusdam illo est',
    'quibusdam autem aliquid et et quia',
    'qui fuga est a eum',
    'saepe unde necessitatibus rem',
    'distinctio laborum qui'
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
