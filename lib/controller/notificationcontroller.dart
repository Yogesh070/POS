import 'package:flutter/material.dart';

class NotificationController extends ChangeNotifier {
  final List<CheckNotificationModel> notification = [
    CheckNotificationModel(title: 'Email'),
    CheckNotificationModel(title: 'App'),
    CheckNotificationModel(title: 'Free'),
    CheckNotificationModel(title: 'Sms'),
  ];

  final List<CheckNotificationModel> allNotification = [
    CheckNotificationModel(title: 'All'),
  ];

  isSingleCheck(int index, bool? value) {
    notification[index].value = !notification[index].value;
    allNotification.first.value =
        notification.every((element) => element.value);
    notifyListeners();
  }

  isCheckAll(bool? value) {
    allNotification.first.value = value!;
    notification.forEach((notification) => notification.value = value);
    notifyListeners();
  }
}

class CheckNotificationModel {
  final String? title;
  bool value;

  CheckNotificationModel({
    required this.title,
    this.value = false,
  });
}
