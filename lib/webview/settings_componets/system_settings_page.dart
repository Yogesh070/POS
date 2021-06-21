import 'package:flutter/material.dart';

import '../main_screen/settings_list_tile.dart';

class SystemSettingsPage extends StatelessWidget {
  final Function onSystemSettingsIndexChanged;
  final int selectedSystemIndex;

  SystemSettingsPage(
    this.onSystemSettingsIndexChanged,
    this.selectedSystemIndex,
  );

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 580,
      child: ListView(
        children: [
          systemSettingsHeader(),
          Material(
            color: Colors.transparent,
            child: SettingsListTile(
              tittle: 'Features',
              style: TextStyle(
                fontSize: 15,
              ),
              color: selectedSystemIndex == 0
                  ? Color(0xffF0F0F0)
                  : Colors.transparent,
              press: () {
                onSystemSettingsIndexChanged(0);
              },
            ),
          ),
          bottomLineDiver(),
          Material(
            color: Colors.transparent,
            child: SettingsListTile(
              tittle: 'Billing & Subscription',
              style: TextStyle(
                fontSize: 15,
              ),
              color: selectedSystemIndex == 1
                  ? Color(0xffF0F0F0)
                  : Colors.transparent,
              press: () {
                onSystemSettingsIndexChanged(1);
              },
            ),
          ),
          bottomLineDiver(),
          Material(
            color: Colors.transparent,
            child: SettingsListTile(
              tittle: 'Payment',
              style: TextStyle(
                fontSize: 15,
              ),
              color: selectedSystemIndex == 2
                  ? Color(0xffF0F0F0)
                  : Colors.transparent,
              press: () {
                onSystemSettingsIndexChanged(2);
              },
            ),
          ),
          bottomLineDiver(),
          Material(
            color: Colors.transparent,
            child: SettingsListTile(
              tittle: 'Loayality',
              style: TextStyle(
                fontSize: 15,
              ),
              color: selectedSystemIndex == 3
                  ? Color(0xffF0F0F0)
                  : Colors.transparent,
              press: () {
                onSystemSettingsIndexChanged(3);
              },
            ),
          ),
          bottomLineDiver(),
          Material(
            color: Colors.transparent,
            child: SettingsListTile(
              tittle: 'Taxes',
              style: TextStyle(
                fontSize: 15,
              ),
              color: selectedSystemIndex == 4
                  ? Color(0xffF0F0F0)
                  : Colors.transparent,
              press: () {
                onSystemSettingsIndexChanged(4);
              },
            ),
          ),
          bottomLineDiver(),
          Material(
            color: Colors.transparent,
            child: SettingsListTile(
              tittle: 'Reciept',
              style: TextStyle(
                fontSize: 15,
              ),
              color: selectedSystemIndex == 5
                  ? Color(0xffF0F0F0)
                  : Colors.transparent,
              press: () {
                onSystemSettingsIndexChanged(5);
              },
            ),
          ),
          bottomLineDiver(),
          Material(
            color: Colors.transparent,
            child: SettingsListTile(
              tittle: 'Dining Option',
              style: TextStyle(
                fontSize: 15,
              ),
              color: selectedSystemIndex == 6
                  ? Color(0xffF0F0F0)
                  : Colors.transparent,
              press: () {
                onSystemSettingsIndexChanged(6);
              },
            ),
          ),
          Divider(
            height: 0.5,
            color: Color(0xffE0E0E0),
          ),
          posSettingsHeader(),
          Material(
            color: Colors.transparent,
            child: SettingsListTile(
              tittle: 'Stores',
              style: TextStyle(
                fontSize: 15,
              ),
              color: selectedSystemIndex == 7
                  ? Color(0xffF0F0F0)
                  : Colors.transparent,
              press: () {
                onSystemSettingsIndexChanged(7);
              },
            ),
          ),
          bottomLineDiver(),
          Material(
            color: Colors.transparent,
            child: SettingsListTile(
              tittle: 'POS Devices',
              style: TextStyle(
                fontSize: 15,
              ),
              color: selectedSystemIndex == 8
                  ? Color(0xffF0F0F0)
                  : Colors.transparent,
              press: () {
                onSystemSettingsIndexChanged(8);
              },
            ),
          ),
        ],
      ),
    );
  }

  Container posSettingsHeader() {
    return Container(
      padding: EdgeInsets.only(left: 18, top: 16, bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffE0E0E0),
          ),
        ),
      ),
      child: Text(
        'POS Settings',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Padding bottomLineDiver() {
    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: Divider(
        height: 0.5,
        color: Color(0xffE0E0E0),
      ),
    );
  }

  Container systemSettingsHeader() {
    return Container(
      padding: EdgeInsets.only(left: 18, top: 16, bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffE0E0E0),
          ),
        ),
      ),
      child: Text(
        'System Settings',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
