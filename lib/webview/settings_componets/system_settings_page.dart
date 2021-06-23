import 'package:flutter/material.dart';

import 'package:pos/controller/settings_controller.dart';
import 'package:pos/webview/components/header_container.dart';
import 'package:pos/webview/components/settings_listtile_webview.dart';

import 'package:provider/provider.dart';

class SystemSettingsPage extends StatelessWidget {
  final Function onSystemSettingsIndexChanged;
  final int selectedSystemIndex;

  SystemSettingsPage(
    this.onSystemSettingsIndexChanged,
    this.selectedSystemIndex,
  );
  Widget build(BuildContext context) {
    var _controller = Provider.of<SettingController>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 580,
      child: Column(
        children: [
          HeaderContainer(title: 'System Settings'),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemCount: _controller.systemSettingList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SettingTileListWeb(
                    title: _controller.systemSettingList[index]['title'],
                    press: () {
                      onSystemSettingsIndexChanged(index);
                    },
                    color: selectedSystemIndex == index
                        ? Color(0xffF0F0F0)
                        : Colors.transparent,
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => bottomLineDiver(),
          ),
          Divider(
            height: 0.5,
            color: Color(0xffE0E0E0),
          ),
          HeaderContainer(title: 'POS Settings'),
          bottomLineDiver(),
          SettingTileListWeb(
            title: _controller.posSettingList[0]['title'],
            color: selectedSystemIndex == 7
                ? Color(0xffF0F0F0)
                : Colors.transparent,
            press: () {
              onSystemSettingsIndexChanged(7);
            },
          ),
          bottomLineDiver(),
          SettingTileListWeb(
            title: _controller.posSettingList[1]['title'],
            color: selectedSystemIndex == 8
                ? Color(0xffF0F0F0)
                : Colors.transparent,
            press: () {
              onSystemSettingsIndexChanged(8);
            },
          ),
        ],
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
}
