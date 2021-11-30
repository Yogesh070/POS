import 'package:flutter/material.dart';
import 'package:pos/screens/payment.dart';
import 'package:pos/screens/payment/splitoption.dart';
import 'cashpayment.dart';
import 'completeaction.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios_new),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Color(0xff30B700),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SpiltOption(),
                ),
              );
            },
            child: Text(
              'Split',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            heightFactor: 2.5,
            child: CustomColumn(rate: 'Rs. 220.00', title: 'Total Amount'),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/cash.jpg"),
                  ),
                  title: const Text('Cash'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CashPayment(),
                      ),
                    );
                  },
                ),
                Divider(
                  thickness: 1,
                  indent: 60,
                  endIndent: 40,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/credit.jpg"),
                  ),
                  title: Text('Card'),
                  onTap: () {},
                ),
                Divider(
                  thickness: 1,
                  indent: 60,
                  endIndent: 40,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/mobile.png"),
                  ),
                  onTap: () {},
                  title: Text('Online'),
                ),
                Divider(
                  thickness: 1,
                  indent: 60,
                  endIndent: 40,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/star.png"),
                  ),
                  onTap: () {},
                  title: Text('Credt'),
                ),
                const Divider(
                  thickness: 1,
                  indent: 60,
                  endIndent: 40,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
