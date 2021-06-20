import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;

  const SecondaryButton(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(title!),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color(0XFFDADADA),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        ),
      ),
    );
  }
}
