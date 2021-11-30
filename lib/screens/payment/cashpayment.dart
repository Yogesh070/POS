import 'package:flutter/material.dart';
import 'package:pos/components/addtextfield.dart';
import 'package:pos/components/primary_button.dart';
import 'package:pos/screens/payment/completeaction.dart';
import 'package:pos/screens/payment/splitoption.dart';
import 'package:pos/utilities/constant.dart';

class CashPayment extends StatelessWidget {
  const CashPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cash Payment',
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
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SpiltOption(),
                ),
              );
            },
            child: Text('Split'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomColumn(rate: 'Rs. 220.00', title: 'Total Amount'),
            ),
            boxHeight,
            Text(
              'Cash Recieved',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            AddTextField(hintText: '250.00'),
            Center(
              heightFactor: 3.5,
              child: SizedBox(
                width: 104,
                height: 37,
                child: PrimaryButton(
                  title: 'Confirm',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CompleteActionPayment(),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
