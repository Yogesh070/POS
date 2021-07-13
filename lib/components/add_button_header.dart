import 'package:flutter/material.dart';
import 'package:pos/components/primary_button.dart';

class AddButtonHeader extends StatelessWidget {
  final VoidCallback buttonOnTap, iconOnTap;

  const AddButtonHeader({
    Key? key,
    required this.buttonOnTap,
    required this.iconOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: iconOnTap,
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        PrimaryButton(
          title: 'Add New',
          onPressed: buttonOnTap,
          icon: Icon(
            Icons.add,
          ),
        )
        // ElevatedButton.icon(
        //   onPressed: buttonOnTap,
        //   style: ElevatedButton.styleFrom(
        //       minimumSize: Size(19, 10),
        //       padding: EdgeInsets.symmetric(
        //         horizontal: 24,
        //         vertical: 12,
        //       ),
        //       primary: Color(0xff30B700)),
        //   icon: Icon(Icons.add),
        //   label: Text('Add New'),
        // )
      ],
    );
  }
}
