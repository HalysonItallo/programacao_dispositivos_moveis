import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final Color color;
  final String tooltip;

  const QuestionButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.color,
    required this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white54,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
        ),
        tooltip: tooltip,
      ),
    );
  }
}
