import 'package:flutter/cupertino.dart';

class ClientController extends ChangeNotifier {
  final clientController = TextEditingController();
  final List<ClientModel> creditorList = [
    ClientModel(
        name: "Chelsi K...", phone: "987556321", email: 'chelsi.k@g...'),
    ClientModel(
        name: "Chelsi K...", phone: "987556321", email: 'chelsi.k@g...'),
    ClientModel(
        name: "Chelsi K...", phone: "987556321", email: 'chelsi.k@g...'),
    ClientModel(
        name: "Chelsi K...", phone: "987556321", email: 'chelsi.k@g...'),
    ClientModel(
        name: "Chelsi K...", phone: "987556321", email: 'chelsi.k@g...'),
    ClientModel(
        name: "Chelsi K...", phone: "987556321", email: 'chelsi.k@g...'),
    ClientModel(
        name: "Chelsi K...", phone: "987556321", email: 'chelsi.k@g...'),
    ClientModel(
        name: "Chelsi K...", phone: "987556321", email: 'chelsi.k@g...'),
  ];

  bool sort = false;
  onSort() {
    sort = !sort;
    notifyListeners();
  }

  deleteSelected() async {
    if (selectedUser.isNotEmpty) {
      List<ClientModel> temp = [];
      temp.addAll(selectedUser);
      for (ClientModel client in temp) {
        creditorList.remove(client);
        selectedUser.remove(client);
        notifyListeners();
      }
    }
  }

  final List<ClientModel> selectedUser = [];

  onSelectRow(bool selected, ClientModel user) {
    if (selected) {
      selectedUser.add(user);
      notifyListeners();
    } else {
      selectedUser.remove(user);
      notifyListeners();
    }
  }
}

class ClientModel {
  String? name;
  String? phone;
  String? email;

  ClientModel({this.name, this.phone, this.email});
}
