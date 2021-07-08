import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final Color color;

  const CustomButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(title!),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          color,
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        ),
      ),
    );
  }
}
