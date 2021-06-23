import 'package:flutter/material.dart';
import 'package:pos/webview/components/drawerheader.dart';
import 'package:pos/webview/components/side_navbar_tile.dart';

class SideMenu extends StatelessWidget {
  final Function onNavIndexChanged;
  final int selectedIndex;
  //initializing constructor

  SideMenu(this.onNavIndexChanged, this.selectedIndex);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          NavDrawerHeaderText(
              title: 'Owner',
              personName: 'Amit Shrestha',
              userName: 'sthaa001'),
          //sideNavTitle for Food and Drinks
          SideNavBarTile(
            sideBarIndicatorColor:
                selectedIndex == 0 ? Color(0xff30B700) : Colors.transparent,
            textIndicatorColor:
                selectedIndex == 0 ? Color(0xff30B700) : Colors.black,
            iconIndicatorColor:
                selectedIndex == 0 ? Color(0xff30B700) : Colors.black,
            title: 'Food and Drinks',
            icon: Icons.fastfood,
            press: () {
              onNavIndexChanged(0);
            },
            selected: selectedIndex == 0,
          ),
          //sideNavTitle for Bills
          SideNavBarTile(
            sideBarIndicatorColor:
                selectedIndex == 1 ? Color(0xff30B700) : Colors.transparent,
            textIndicatorColor:
                selectedIndex == 1 ? Color(0xff30B700) : Colors.black,
            iconIndicatorColor:
                selectedIndex == 1 ? Color(0xff30B700) : Colors.black,
            title: 'Bills',
            icon: Icons.line_style,
            press: () {
              onNavIndexChanged(1);
            },
            selected: selectedIndex == 1,
          ),
          //sideNavTitle for Items
          SideNavBarTile(
            sideBarIndicatorColor:
                selectedIndex == 2 ? Color(0xff30B700) : Colors.transparent,
            textIndicatorColor:
                selectedIndex == 2 ? Color(0xff30B700) : Colors.black,
            iconIndicatorColor:
                selectedIndex == 2 ? Color(0xff30B700) : Colors.black,
            title: 'Items',
            icon: Icons.list,
            press: () {
              onNavIndexChanged(2);
            },
            selected: selectedIndex == 2,
          ),
          //sideNavTitle for Creditors
          SideNavBarTile(
            sideBarIndicatorColor:
                selectedIndex == 3 ? Color(0xff30B700) : Colors.transparent,
            textIndicatorColor:
                selectedIndex == 3 ? Color(0xff30B700) : Colors.black,
            iconIndicatorColor:
                selectedIndex == 3 ? Color(0xff30B700) : Colors.black,
            title: 'Creditors',
            icon: Icons.credit_card,
            press: () {
              onNavIndexChanged(3);
            },
            selected: selectedIndex == 3,
          ),
          //sideNavTitle for Notifications
          SideNavBarTile(
            sideBarIndicatorColor:
                selectedIndex == 4 ? Color(0xff30B700) : Colors.transparent,
            textIndicatorColor:
                selectedIndex == 4 ? Color(0xff30B700) : Colors.black,
            iconIndicatorColor:
                selectedIndex == 4 ? Color(0xff30B700) : Colors.black,
            title: 'Notifications',
            icon: Icons.notifications,
            press: () {
              onNavIndexChanged(4);
            },
            selected: selectedIndex == 4,
          ),
          //sideNavTitle for Settings
          SideNavBarTile(
            sideBarIndicatorColor:
                selectedIndex == 5 ? Color(0xff30B700) : Colors.transparent,
            textIndicatorColor:
                selectedIndex == 5 ? Color(0xff30B700) : Colors.black,
            iconIndicatorColor:
                selectedIndex == 5 ? Color(0xff30B700) : Colors.black,
            title: 'Settings',
            icon: Icons.settings,
            press: () {
              onNavIndexChanged(5);
            },
            selected: selectedIndex == 5,
          ),
          Divider(
            color: Colors.black.withOpacity(0.15),
          ),
          //sideNavTitle for Apps
          SideNavBarTile(
            sideBarIndicatorColor:
                selectedIndex == 6 ? Color(0xff30B700) : Colors.transparent,
            textIndicatorColor:
                selectedIndex == 6 ? Color(0xff30B700) : Colors.black,
            iconIndicatorColor:
                selectedIndex == 6 ? Color(0xff30B700) : Colors.black,
            title: 'Apps',
            icon: Icons.app_settings_alt,
            press: () {
              onNavIndexChanged(6);
            },
            selected: selectedIndex == 6,
          ),
          //sideNavTitle for Help
          SideNavBarTile(
            sideBarIndicatorColor:
                selectedIndex == 7 ? Color(0xff30B700) : Colors.transparent,
            textIndicatorColor:
                selectedIndex == 7 ? Color(0xff30B700) : Colors.black,
            iconIndicatorColor:
                selectedIndex == 7 ? Color(0xff30B700) : Colors.black,
            title: 'Help',
            icon: Icons.help,
            press: () {
              onNavIndexChanged(7);
            },
            selected: selectedIndex == 7,
          ),
        ],
      ),
    );
  }
}
