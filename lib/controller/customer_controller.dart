import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:pos/model/customer.dart';

class CustomerController extends ChangeNotifier {
  Customer? toEditCustomer;

  final List<Customer> _customer = [
    Customer(
        email: 'ChelsiKetan99@mail.com',
        name: 'Chelsi Ketan',
        note: 'note',
        phone: '986454564465',
        image: 'image',
        address: 'phokhara'),
    Customer(
        email: 'KritiGurung@mail.com',
        name: 'Kriti Gurung',
        note: 'note',
        phone: '986454564465',
        image: 'image',
        address: 'Pokhara '),
    Customer(
        email: 'AmitShrestha9@mail.com',
        name: 'Amit Shrestha',
        note: 'note',
        phone: '986454564465',
        image: 'image',
        address: 'NayaBazar Pokhara'),
    Customer(
        email: 'ChelsiKetan99@mail.com',
        name: 'Chelsi Ketan',
        note: 'note',
        phone: '986454564465',
        image: 'image',
        address: 'phokhara'),
    Customer(
        email: 'KritiGurung@mail.com',
        name: 'Kriti Gurung',
        note: 'note',
        phone: '986454564465',
        image: 'image',
        address: 'Pokhara '),
    Customer(
        email: 'AmitShrestha9@mail.com',
        name: 'Amit Shrestha',
        note: 'note',
        phone: '986454564465',
        image: 'image',
        address: 'NayaBazar Pokhara'),
  ];
  UnmodifiableListView<Customer> get customers =>
      UnmodifiableListView(_customer);

  void addCustomer(Customer customer) {
    _customer.add(customer);
    notifyListeners();
  }

  void editCustomer(Customer customer) {
    int index = _customer.indexOf(toEditCustomer!);
    _customer[index] = customer;
    notifyListeners();
  }
}
