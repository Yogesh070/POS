import 'package:flutter/material.dart';
import 'package:pos/webview/main_screen/sidemenu.dart';

import '../settings_componets/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            //passing function
            child: SideMenu((int index) {
              setState(() {
                selectedIndex = index;
              });
            }, selectedIndex),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Builder(
                builder: (context) {
                  switch (selectedIndex) {
                    case 0:
                      return Center(child: Text('Food and Drinks'));
                    case 1:
                      return Center(child: Text('Bills'));
                    case 2:
                      return Center(child: Text('Items'));

                    case 3:
                      return Center(child: Text('Creditors'));
                    case 4:
                      return Center(child: Text('Notification'));
                    case 5:
                      return SettingsScreen();
                    case 6:
                      return Center(child: Text('App'));
                    case 7:
                      return Center(child: Text('Help'));
                    default:
                  }
                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
