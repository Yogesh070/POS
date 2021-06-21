import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    Key? key,
    required this.tittle,
    required this.press,
    required this.style,
    required this.color,
  }) : super(key: key);

  final String tittle;

  final VoidCallback press;

  final TextStyle style;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 2,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 2,
      ),
      title: Text(tittle, style: style),
      onTap: press,
      tileColor: color,
    );
  }
}
