import 'package:flutter/material.dart';

class PaymentModel {
  String paymentType;
  Image image;
  bool isSelected;
  
  PaymentModel(this.paymentType, this.image, this.isSelected);
}
