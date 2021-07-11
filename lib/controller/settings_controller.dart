import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pos/screens/features.dart';
import 'package:pos/screens/loayalityscreen/mobile_loyality_screen.dart';
import 'package:pos/screens/taxloyalityscreen/mobile_tax_screen.dart';

class SettingController extends ChangeNotifier {
  bool settingScreenFlag = false;
  bool featureScreenFlag = false;
  bool switchValue = true;

  changeSwitchValue(int index) {
    _featureOptions[index].isOn = !_featureOptions[index].isOn!;
    notifyListeners();
  }

  changeSettingFlag() {
    settingScreenFlag = !settingScreenFlag;
    notifyListeners();
  }

  changeFeatureFlag() {
    featureScreenFlag = !featureScreenFlag;
    notifyListeners();
  }

  final List<Map<String, dynamic>> systemSettingList = [
    {
      "title": "Features",
      "route": FeaturesScreen(),
    },
    {
      "title": "Billing & Subscription",
      "route": FeaturesScreen(),
    },
    {
      "title": "Payment",
      "route": FeaturesScreen(),
    },
    {
      "title": "Loyalty",
      "route": MobileLoyalityScreen(),
    },
    {
      "title": "Taxes",
      "route": MobileTaxScreen(),
    },
    {
      "title": "Receipt",
      "route": FeaturesScreen(),
    },
    {
      "title": "Dining Option",
      "route": FeaturesScreen(),
    },
    // "Features",
    // "Billing & Subscription",
    // "Payment",
    // "Loyalty",
    // "Taxes",
    // "Receipt",
    // "Dining Option"
  ];

  final List<Map<String, dynamic>> posSettingList = [
    {
      "title": "Stores",
      "route": FeaturesScreen(),
    },
    {
      "title": "POS Devices",
      "route": FeaturesScreen(),
    },
  ];

  UnmodifiableListView<FeatureOption> get featureOptionList =>
      UnmodifiableListView(_featureOptions);

  final List<FeatureOption> _featureOptions = [
    FeatureOption(
      title: "Shifts",
      subtitle: "Track cash that goes in and out of your drawer",
      isOn: false,
    ),
    FeatureOption(
      title: "Time clock",
      subtitle:
          "Track employee' clock in/out time and calculate total work hours",
      isOn: false,
    ),
    FeatureOption(
      title: "Open tickets",
      subtitle: "Allow to save and edit orders before completing a payment",
      isOn: false,
    ),
    FeatureOption(
      title: "Kitchen printers",
      subtitle: "Send orders to kitchen printer or display",
      isOn: false,
    ),
    FeatureOption(
      title: "Customer display",
      subtitle:
          "Display order information to customers at the time of purchase",
      isOn: false,
    ),
    FeatureOption(
      title: "Dining option",
      subtitle: "Mark orders as dine in takeaway or for delivery",
      isOn: false,
    ),
    FeatureOption(
      title: "Low stock notification",
      subtitle: "Get daily email on items that are low or out of stock",
      isOn: false,
    ),
    FeatureOption(
      title: "Negative stock alert",
      subtitle: "Warn cashiers attempting to sell more inventory",
      isOn: false,
    ),
  ];

  /*------------------- Tax Option List ---------------------*/

  List<TaxOption> _taxs = [
    TaxOption(
      taxName: 'VAT',
      taxCharged: '13',
    ),
    TaxOption(
      taxName: 'Service Charge',
      taxCharged: '10',
    ),
  ];
  void updateTax(TaxOption taxOption) {
    taxOption.toogleAdded();
    notifyListeners();
  }

  void addTax(String newTaxTitle) {
    final tax = TaxOption(taxName: newTaxTitle);
    _taxs.add(tax);
    notifyListeners();
  }

  void addCharge(String newTaxCharge) {
    final tax = TaxOption(taxCharged: newTaxCharge);
    _taxs.add(tax);
    notifyListeners();
  }

//for adding tax and charge rate in tax screen of mobile

  void addMobileTax(String newTaxTitle, String newTaxCharge) {
    final tax = TaxOption(taxName: newTaxTitle, taxCharged: newTaxCharge);
    _taxs.add(tax);
    notifyListeners();
  }

  void removeTax(TaxOption taxOption) {
    if (taxOption.isAdded == true) {
      _taxs.remove(taxOption);
      print('deleted');
      notifyListeners();
    } else {
      print('not deleted');
      notifyListeners();
    }
  }

  UnmodifiableListView<TaxOption> get taxs => UnmodifiableListView(_taxs);
  /*------------------- Tax Option List Ending  ---------------------*/

  /*------------------- Loyality Option List Starting  ---------------------*/
  List<LoyalityOption> _loyality = [
    LoyalityOption(
      type: 'Frequent visit',
      bonus: '10',
    ),
    // LoyalityOption(
    //   type: 'Service Charge',
    //   bonus: '10%',
    // ),
  ];

  void addLoyalityMobile(String newLoyalityType, String newLoyalityBonus) {
    final loyality =
        LoyalityOption(type: newLoyalityType, bonus: newLoyalityBonus);
    _loyality.add(loyality);
    notifyListeners();
  }

  UnmodifiableListView<LoyalityOption> get loyality =>
      UnmodifiableListView(_loyality);

/*------------------- Loyality Option List Ending  ---------------------*/
}

class FeatureOption {
  String? title;
  String? subtitle;
  bool? isOn;

  FeatureOption({this.title, this.subtitle, this.isOn});
}

class TaxOption {
  String? taxName;
  String? taxCharged;
  bool? isAdded;

  TaxOption({this.taxName, this.taxCharged, this.isAdded = false});

  void toogleAdded() {
    isAdded = !isAdded!;
  }
}

class LoyalityOption {
  String? type;
  String? bonus;

  LoyalityOption({
    this.type,
    this.bonus,
  });
}
