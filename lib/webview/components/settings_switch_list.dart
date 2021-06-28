import 'package:flutter/material.dart';
import 'package:pos/screens/loyality.dart';
import 'package:pos/screens/tax.dart';
import 'package:pos/webview/settings_componets/features_page.dart';

class SettingsSwitchList extends StatelessWidget {
  const SettingsSwitchList({
    Key? key,
    required this.selectedSettingsindex,
  }) : super(key: key);

  final int selectedSettingsindex;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        switch (selectedSettingsindex) {
          case 0:
            return FeaturesPage();
          case 1:
            return Center(child: Text('Billing & Subscription'));
          case 2:
            return Center(child: Text('Payment'));
          case 3:
            return LoyalityScreen();
          case 4:
            return TaxScreen();
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
    );
  }
}
