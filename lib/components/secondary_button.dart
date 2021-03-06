import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final Icon? icon;
  final double? horizontalIconSpace;
  final EdgeInsets? padding;

  const SecondaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.horizontalIconSpace = 4,
    this.icon,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? SizedBox.shrink(),
          (icon != null)
              ? SizedBox(
                  width: horizontalIconSpace,
                )
              : SizedBox.shrink(),
          Text(title!),
        ],
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color(0XFFDADADA),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        padding: MaterialStateProperty.all(
          padding ?? EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        ),
      ),
    );
  }
}
