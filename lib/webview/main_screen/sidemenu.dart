import 'package:flutter/material.dart';

import 'drawer_list_tile.dart';

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
          drawerHeaderName(),
          foodAndDrinksTile(),
          billsTile(),
          itemsTile(),
          creditorsTile(),
          notificationTile(),
          settingsTile(),
          Divider(
            color: Colors.black.withOpacity(0.15),
          ),
          appTile(),
          helpTile(),
        ],
      ),
    );
  }

// All Side Menu Bar Methods

  Row helpTile() {
    return Row(
      children: [
        Container(
          width: 4,
          height: 25,
          color: selectedIndex == 7 ? Color(0xff30B700) : Colors.transparent,
        ),
        Expanded(
          child: DrawerListTile(
            tittle: 'Help',
            style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: selectedIndex == 7 ? Color(0xff30B700) : Colors.black,
            ),
            icon: IconTheme(
              data: IconThemeData(
                color: selectedIndex == 7 ? Color(0xff30B700) : Colors.black,
              ),
              child: Icon(
                Icons.help,
              ),
            ),
            press: () {
              onNavIndexChanged(7);
            },
            selected: selectedIndex == 7,
          ),
        ),
      ],
    );
  }

  Row appTile() {
    return Row(
      children: [
        Container(
          width: 4,
          height: 25,
          color: selectedIndex == 6 ? Color(0xff30B700) : Colors.transparent,
        ),
        Expanded(
          child: DrawerListTile(
            tittle: 'App',
            style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: selectedIndex == 6 ? Color(0xff30B700) : Colors.black,
            ),
            icon: IconTheme(
              data: IconThemeData(
                color: selectedIndex == 6 ? Color(0xff30B700) : Colors.black,
              ),
              child: Icon(
                Icons.app_settings_alt,
              ),
            ),
            press: () {
              onNavIndexChanged(6);
            },
            selected: selectedIndex == 6,
          ),
        ),
      ],
    );
  }

  Row settingsTile() {
    return Row(
      children: [
        Container(
          width: 4,
          height: 25,
          color: selectedIndex == 5 ? Color(0xff30B700) : Colors.transparent,
        ),
        Expanded(
          child: DrawerListTile(
            tittle: 'Settings',
            style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: selectedIndex == 5 ? Color(0xff30B700) : Colors.black,
            ),
            icon: IconTheme(
              data: IconThemeData(
                color: selectedIndex == 5 ? Color(0xff30B700) : Colors.black,
              ),
              child: Icon(
                Icons.settings,
              ),
            ),
            press: () {
              onNavIndexChanged(5);
            },
            selected: selectedIndex == 5,
          ),
        ),
      ],
    );
  }

  Row notificationTile() {
    return Row(
      children: [
        Container(
          width: 4,
          height: 25,
          color: selectedIndex == 4 ? Color(0xff30B700) : Colors.transparent,
        ),
        Expanded(
          child: DrawerListTile(
            tittle: 'Notifications',
            style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: selectedIndex == 4 ? Color(0xff30B700) : Colors.black,
            ),
            icon: IconTheme(
              data: IconThemeData(
                color: selectedIndex == 4 ? Color(0xff30B700) : Colors.black,
              ),
              child: Icon(
                Icons.notifications,
              ),
            ),
            press: () {
              onNavIndexChanged(4);
            },
            selected: selectedIndex == 4,
          ),
        ),
      ],
    );
  }

  Row creditorsTile() {
    return Row(
      children: [
        Container(
          width: 4,
          height: 25,
          color: selectedIndex == 3 ? Color(0xff30B700) : Colors.transparent,
        ),
        Expanded(
          child: DrawerListTile(
            tittle: 'Creditors',
            style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: selectedIndex == 3 ? Color(0xff30B700) : Colors.black,
            ),
            icon: IconTheme(
              data: IconThemeData(
                color: selectedIndex == 3 ? Color(0xff30B700) : Colors.black,
              ),
              child: Icon(
                Icons.credit_card,
              ),
            ),
            press: () {
              onNavIndexChanged(3);
            },
            selected: selectedIndex == 3,
          ),
        ),
      ],
    );
  }

  Row itemsTile() {
    return Row(
      children: [
        Container(
          width: 4,
          height: 25,
          color: selectedIndex == 2 ? Color(0xff30B700) : Colors.transparent,
        ),
        Expanded(
          child: ListTile(
            horizontalTitleGap: 0,
            title: Text(
              'Items',
              style: TextStyle(
                fontFamily: 'Roboto-Regular',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: selectedIndex == 2 ? Color(0xff30B700) : Colors.black,
              ),
            ),
            leading: Icon(
              Icons.list,
              color: selectedIndex == 2 ? Color(0xff30B700) : Colors.black,
            ),
            trailing: Transform.translate(
              offset: Offset(-60, 0),
              child: DropdownButton(
                underline: SizedBox(),
                items: [],
              ),
            ),
            onTap: () {
              onNavIndexChanged(2);
            },
            selected: selectedIndex == 2,
          ),
        ),
      ],
    );
  }

  Row billsTile() {
    return Row(
      children: [
        Container(
          width: 4,
          height: 25,
          color: selectedIndex == 1 ? Color(0xff30B700) : Colors.transparent,
        ),
        Expanded(
          child: DrawerListTile(
            tittle: 'Bills',
            style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: selectedIndex == 1 ? Color(0xff30B700) : Colors.black,
            ),
            icon: IconTheme(
              data: IconThemeData(
                color: selectedIndex == 1 ? Color(0xff30B700) : Colors.black,
              ),
              child: Icon(
                Icons.line_style_rounded,
              ),
            ),
            press: () {
              onNavIndexChanged(1);
            },
            selected: selectedIndex == 1,
          ),
        ),
      ],
    );
  }

  Row foodAndDrinksTile() {
    return Row(
      children: [
        Container(
          width: 4,
          height: 25,
          color: selectedIndex == 0 ? Color(0xff30B700) : Colors.transparent,
        ),
        Expanded(
          child: DrawerListTile(
            tittle: 'Food and Drinks',
            style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: selectedIndex == 0 ? Color(0xff30B700) : Colors.black,
            ),
            icon: IconTheme(
              data: IconThemeData(
                color: selectedIndex == 0 ? Color(0xff30B700) : Colors.black,
              ),
              child: Icon(
                Icons.fastfood,
              ),
            ),
            press: () {
              onNavIndexChanged(0);
            },
            selected: selectedIndex == 0,
          ),
        ),
      ],
    );
  }

  Container drawerHeaderName() {
    return Container(
      width: double.infinity,
      height: 126.9,
      child: DrawerHeader(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //direction: Axis.vertical,
            children: [
              Text(
                'Owner',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Text(
                'Amit Shrestha',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'sthaa001',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(color: Colors.green),
      ),
    );
  }
}
