import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pos/model/diningModel.dart';
import 'package:pos/screens/dining.dart';
import 'package:pos/screens/features.dart';
import 'package:pos/screens/payment.dart';
import 'package:pos/screens/receipt.dart';

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
      "route": PaymentScreen(),
    },
    {
      "title": "Loyalty",
      "route": FeaturesScreen(),
    },
    {
      "title": "Taxes",
      "route": FeaturesScreen(),
    },
    {
      "title": "Receipt",
      "route": ReceiptScreen(),
    },
    {
      "title": "Dining Option",
      "route": DiningScreen(),
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
    TaxOption(taxName: 'VAT'),
    TaxOption(taxName: 'Service Charge'),
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

  void deleteTax(TaxOption taxOption) {
    _taxs.remove(taxOption);
    notifyListeners();
  }
}

class TaxOption {
  String? taxName;
  bool? isAdded;

  TaxOption({this.taxName, this.isAdded = false});

  void toogleAdded() {
    isAdded = !isAdded!;
  }
}
/*------------------- Tax Option List Ending  ---------------------*/

class FeatureOption {
  String? title;
  String? subtitle;
  bool? isOn;

  FeatureOption({this.title, this.subtitle, this.isOn});
}

/*------------------- Adding Dining List ---------------------*/

class DiningNotifier extends ChangeNotifier {
  List<DiningModel> _diningList = [];
  UnmodifiableListView<DiningModel> get diningDetail =>
      UnmodifiableListView(_diningList);
  DiningModel? _selectedDining;

  addDining(DiningModel diningModel) {
    _diningList.add(diningModel);
    notifyListeners();
  }

  void selectSingleCheckBox(bool val, int index) {
    for (DiningModel items in _diningList) {
      items.isOn = false;
    }
    _diningList[index].isOn = val;
    _selectedDining = _diningList[index];
    // print(_selectedDining!.diningName);
    notifyListeners();
  }

  void removeDining(DiningModel diningModel) {
    if (diningModel.isOn == true) {
      _diningList.remove(diningModel);
      print('deleted');
      notifyListeners();
    } else {
      print('not deleted');
      notifyListeners();
    }
  }
}
