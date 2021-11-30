import 'package:flutter/material.dart';

class PosDeviceScreen extends StatelessWidget {
  const PosDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Devices",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff30B700),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 24),
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('POS ${index + 1}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.circle,
                  size: 8,
                  color: index.isEven ? Color(0xff30B700) : Colors.black,
                ),
                SizedBox(width: 8),
                index.isEven ? Text('Active ') : Text('InActive'),
              ],
            ),
          );
        },
        itemCount: 3,
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Color(0xffE0E0E0),
          thickness: 1,
        ),
      ),
    );
  }
}
