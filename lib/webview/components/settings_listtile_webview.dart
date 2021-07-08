import 'package:flutter/material.dart';

class SettingTileListWeb extends StatelessWidget {
  final String title;
  final VoidCallback press;

  final Color color;
  const SettingTileListWeb({
    Key? key,
    required this.title,
    required this.press,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        horizontalTitleGap: 2,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 2,
        ),
        tileColor: color,
        onTap: press,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
