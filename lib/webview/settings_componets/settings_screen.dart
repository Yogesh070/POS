import 'package:flutter/material.dart';
import 'package:pos/webview/settings_componets/features_page.dart';
import 'package:pos/webview/settings_componets/system_settings_page.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int selectedSettingsindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(13),
                offset: Offset(0, 3.0),
                blurRadius: 6,
              )
            ],
          ),
          child: AppBar(
            title: Text(
              'Settings',
              style: TextStyle(
                fontFamily: 'Roboto-Medium',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xffF4F4F4),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 40,
          right: 40,
          bottom: 10,
          top: 40,
        ),
        child: Row(
          children: [
            Expanded(
              child: SystemSettingsPage((int index) {
                setState(() {
                  selectedSettingsindex = index;
                });
              }, selectedSettingsindex),
            ),
            SizedBox(
              width: 50,
            ),
            Expanded(
              child: Builder(
                builder: (context) {
                  switch (selectedSettingsindex) {
                    case 0:
                      return FeaturesPage();
                    case 1:
                      return Center(child: Text('Billing & Subscription'));
                    case 2:
                      return Center(child: Text('Payment'));
                    case 3:
                      return Center(child: Text('Loyality'));
                    case 4:
                      return Center(child: Text('Taxes'));
                    case 5:
                      return Center(child: Text('Reciept'));
                    case 6:
                      return Center(child: Text('Dining Option'));
                    case 7:
                      return Center(child: Text('Stores'));
                    case 8:
                      return Center(child: Text('POS Devices'));
                    default:
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
