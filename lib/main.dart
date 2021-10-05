import 'package:flutter/material.dart';
import 'package:pos/controller/settings_controller.dart';
import 'package:pos/controller/storesController.dart';
import 'package:pos/controller/sidenav_controller.dart';
import 'package:pos/screens/homepage.dart';
import 'package:provider/provider.dart';
import 'controller/client_controller.dart';
import 'controller/creditor_controller.dart';
import 'controller/notificationcontroller.dart';
import 'controller/payment_controller.dart';
import 'controller/ticket.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SettingController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SideNavController(),
        ),
        ChangeNotifierProvider(
          create: (_) => DiningNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => PaymentNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => StoreController(),
        ),
        ChangeNotifierProvider(
          create: (_) => TicketProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CreditorController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ClientController(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationController(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: Colors.black),
            iconTheme: IconThemeData(color: Colors.black),
            foregroundColor: Colors.black,

            // titleTextStyle: TextStyle(color: Colors.red),
          ),
          primarySwatch: Colors.blue,
        ),
        home: Homepage(),
      ),
    );
  }
}
