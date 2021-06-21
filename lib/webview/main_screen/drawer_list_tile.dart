import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.tittle,
    required this.icon,
    required this.press,
    required this.selected,
    required this.style,
  }) : super(key: key);

  final String tittle;
  final IconTheme icon;
  final VoidCallback press;
  final bool selected;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 2,
      leading: icon,
      title: Text(tittle, style: style),
      onTap: press,
    );
  }
}
