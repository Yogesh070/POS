import 'package:flutter/material.dart';
import 'package:pos/components/primary_button.dart';

class SplitPersonContainer extends StatelessWidget {
  const SplitPersonContainer({
    Key? key,
    required this.number,
    required this.textField,
    this.onChanged,
  }) : super(key: key);

  final int number;
  final Widget textField;
  final Function()? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Person 1',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Cash'),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          textField,
          Container(
            margin: EdgeInsets.only(top: 15),
            width: 74,
            height: 37,
            child: PrimaryButton(
              padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
              title: 'Pay',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
