import 'package:flutter/material.dart';
import 'package:number_pagination/number_pagination.dart';

class Pagination extends StatelessWidget {
  final int selectedPage;
  final int limit;
  final int totalItems;
  final ValueChanged<int> onChange;

  const Pagination({
    Key? key,
    required this.totalItems,
    required this.limit,
    required this.onChange,
    required this.selectedPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int pageTotal = totalItems % limit == 0
        ? totalItems ~/ limit
        : (totalItems ~/ limit) + 1;

    return NumberPagination(
      pageTotal: pageTotal,
      pageInit: selectedPage,
      onPageChanged: onChange,
      fontSize: 12,
    );
  }
}
