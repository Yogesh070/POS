import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:pos/model/paymentModel.dart';

class PaymentNotifier extends ChangeNotifier {
  List<PaymentModel> _paymentList = [];
  UnmodifiableListView<PaymentModel> get paymentDetail =>
      UnmodifiableListView(_paymentList);
  PaymentModel? _selectedPayment;

  addPayment(PaymentModel paymentModel) {
    _paymentList.add(paymentModel);
    //print(_paymentList);
    notifyListeners();
  }

  void selectSingleCheckBox(bool val, int index) {
    for (PaymentModel items in _paymentList) {
      items.isSelected = false;
    }
    _paymentList[index].isSelected = val;
    _selectedPayment = _paymentList[index];
    // print(_selectedPayment!.paymentType);
    notifyListeners();
  }
}
