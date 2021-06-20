import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;

  const PrimaryButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0XFF30B700)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        ),
      ),
      onPressed: onPressed,
      child: Text(title!),
    );
  }
}
