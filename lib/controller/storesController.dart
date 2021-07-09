import 'package:flutter/material.dart';

class StoreController extends ChangeNotifier {
  addItemInTheList(String value1, String value2, String value3) {
    storeOption.add(
      StoresOption(name: value1, location: value2, contact: value3),
    );
    notifyListeners();
  }

  final List<StoresOption> storeOption = [
    StoresOption(
        name: "Dunga Restro...",
        location: "LakeSide,Pokhara",
        contact: "984563215"),
    StoresOption(
        name: "Cloud 9 Restro...",
        location: "ChipleDhunga,Pokhara",
        contact: "987556321")
  ];
}

class StoresOption {
  String? name;
  String? location;
  String? contact;

  StoresOption({this.name, this.contact, this.location});
}
