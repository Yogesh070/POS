import 'package:flutter/material.dart';
import 'package:pos/controller/settings_controller.dart';
import 'package:pos/controller/storesController.dart';
import 'package:pos/screens/settings.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StoreController(),
        ),
        ChangeNotifierProvider(
          create: (_) => SettingController(),
        ),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          foregroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.red),
        ),
        primarySwatch: Colors.blue,
      ),
      home: Settings(),
    );
  }
}
