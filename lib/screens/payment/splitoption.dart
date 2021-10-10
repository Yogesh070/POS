import 'package:flutter/material.dart';
import 'package:pos/components/addtextfield.dart';
import 'package:pos/components/circlebutton.dart';
import 'package:pos/components/splitpersoncontainer.dart';

class SpiltOption extends StatelessWidget {
  const SpiltOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Remaining 220.00',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 30),
              width: size.width * 0.66,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff707070),
                    blurRadius: 1.0,
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleButton(
                    icon: Icons.remove,
                    onPressed: () {},
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '2',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Person(s)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff7A7A7A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  CircleButton(
                    icon: Icons.add,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: ListView(
              children: [
                SplitPersonContainer(
                  number: 1,
                  textField: AddTextField(
                    hintText: '110.00',
                  ),
                  onChanged: () {},
                ),
                SplitPersonContainer(
                  number: 2,
                  textField: AddTextField(
                    hintText: '110.00',
                  ),
                  onChanged: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
