import 'package:flutter/material.dart';

var boxHeight = SizedBox(
  height: 10,
);
var boxWidth = SizedBox(
  width: 20,
);

const divider = Divider(thickness: 1);

class LabelText extends StatelessWidget {
  const LabelText({
    Key? key,
    required this.labelName,
  }) : super(key: key);

  final String labelName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        labelName,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
