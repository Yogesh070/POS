import 'package:flutter/material.dart';
import 'package:pos/components/responsive_screen.dart';
import 'package:pos/controller/sidenav_controller.dart';
import 'package:pos/webview/components/settings_switch_list.dart';

import 'package:pos/webview/settings_componets/system_settings_page.dart';
import 'package:provider/provider.dart';

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
            leading: (!ResponsiveScreen.isdesktop(context))
                ? IconButton(
                    onPressed: () {
                      Provider.of<SideNavController>(context, listen: false)
                          .controlNavBar();
                    },
                    icon: Icon(Icons.menu),
                    color: Colors.black,
                  )
                : null,
            title: Text(
              'Settings',
              style: TextStyle(
                fontFamily: 'Roboto-Medium',
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 48.0),
                child: Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Ram Thapa',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xff707070),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
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
              child: SettingsSwitchList(
                  selectedSettingsindex: selectedSettingsindex),
            ),
          ],
        ),
      ),
    );
  }
}
