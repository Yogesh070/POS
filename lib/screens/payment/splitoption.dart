import 'package:flutter/material.dart';
import 'package:pos/components/addtextfield.dart';
import 'package:pos/components/circlebutton.dart';
import 'package:pos/components/splitpersoncontainer.dart';
import 'package:pos/controller/payment_controller.dart';
import 'package:provider/provider.dart';

class SpiltOption extends StatelessWidget {
  const SpiltOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _con = Provider.of<PaymentNotifier>(context);
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 42),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff707070),
                    blurRadius: 2.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleButton(
                    icon: Icons.remove,
                    onPressed: () {
                      _con.removeSplitWidget();
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_con.splitWidget.length}',
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
                    onPressed: () {
                      _con.addSplitWidget(
                        SplitPersonContainer(
                          number: _con.splitWidget.length,
                          textField: AddTextField(
                            hintText: '110.00',
                          ),
                          onChanged: () {},
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) => _con.splitWidget[index],
                  itemCount: _con.splitWidget.length),
            ),
          ],
        ),
      ),
    );
  }
}
