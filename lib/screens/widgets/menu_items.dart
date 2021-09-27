import 'package:flutter/material.dart';

class MenuItemText extends StatelessWidget {
  final String itemName;
  final int itemQuantity;
  final double itemRate;
  final Function()? onTap;
  const MenuItemText({
    Key? key,
    required this.itemName,
    required this.itemQuantity,
    required this.itemRate,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(itemName),
              Text(' x$itemQuantity'),
            ],
          ),
          Text('Rs. $itemRate'),
        ],
      ),
    );
  }
}
