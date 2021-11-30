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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  itemName,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(width: 8),
                Text(
                  ' x $itemQuantity',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Text('Rs. $itemRate'),
          ],
        ),
      ),
    );
  }
}
