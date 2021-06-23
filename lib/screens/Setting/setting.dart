import 'package:flutter/material.dart';
import 'package:orderscreen/ConstantValues/colors.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            elevation: 2.0,
            title: Text(
              'Setting',
              style: secondMediumTextStyle,
            ),
            backgroundColor: Colors.white,
          ),
          body: ListView(children: [
            Container(
              margin: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'System Settings',
                    style: secondMediumTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Divider(
                      color: Color(0xffE0E0E0),
                      thickness: 1.0,
                    ),
                  ),
                  _settingContent(name: 'Features'),
                  _settingContent(name: 'Billing & Subscriptions'),
                  GestureDetector(
                    child: _settingContent(
                      name: 'Payment',
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/payment');
                    },
                  ),
                  _settingContent(name: 'Loyalty'),
                  _settingContent(name: 'Taxes'),
                  _settingContent(name: 'Receipt'),
                  _settingContent(name: 'Dinning Option'),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'POS Settings',
                      style: secondMediumTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Divider(
                      color: Color(0xffE0E0E0),
                      thickness: 1.0,
                    ),
                  ),
                  _settingContent(name: 'Stores'),
                  _settingContent(name: "POS Devices")
                ],
              ),
            ),
          ])),
    );
  }

  Widget _settingContent({@required String name}) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                name,
                style: normalMediumTextStyle,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Divider(
            color: Color(0xffE0E0E0),
            thickness: 1.0,
          ),
        ),
      ],
    );
  }
}
