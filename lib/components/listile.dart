import 'package:flutter/material.dart';

class TileListBox extends StatelessWidget {
  final String taxTitle;
  final Widget? merge;
  final String amount;
  final String? created;
  final bool? isChecked;
  final Function(bool?)? chechBoxCallback;
  final void Function()? onLongPress;
  final void Function()? onTap;

  const TileListBox(
      {Key? key,
      required this.taxTitle,
      this.isChecked,
      this.chechBoxCallback,
      this.onLongPress,
      this.onTap,
      required this.amount,
      this.created,
      this.merge})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0,
      horizontalTitleGap: 10,
      onLongPress: onLongPress,
      leading: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Transform.scale(
            scale: 0.7,
            child: Transform.translate(
              offset: Offset(0, 4),
              child: Checkbox(
                value: isChecked,
                onChanged: chechBoxCallback,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      trailing: Text(
        amount,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      onTap: onTap,
      title: Row(
        //   alignment: WrapAlignment.spaceBetween
        children: [
          Text(
            taxTitle,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
          ),
          Transform.scale(
            scale: 0.7,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff30B700).withOpacity(0.2),
                borderRadius: BorderRadius.circular(5),
              ),
              // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              //margin: EdgeInsets.only(right: 15),
              //margin: const EdgeInsets.only(right: 20.0),
              child: merge ?? null,
            ),
          ),
        ],
      ),
      subtitle: Text(
        created!,
        style: TextStyle(
          fontSize: 12,
          color: Color(0xff707070),
        ),
      ),
    );
  }
}
