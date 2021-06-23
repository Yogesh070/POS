import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:orderscreen/model/paymentModel.dart';

class PaymentNotifier extends ChangeNotifier {
  List<PaymentModel> _paymentModel = [];
  UnmodifiableListView<PaymentModel> get paymentDetail =>
      UnmodifiableListView(_paymentModel);
  
  addPayment(PaymentModel paymentModel) {
    _paymentModel.add(paymentModel);
    notifyListeners();
  }


}
