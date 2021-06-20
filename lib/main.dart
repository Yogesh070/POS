import 'package:flutter/material.dart';
import 'package:pos/controller/settings_controller.dart';
import 'package:pos/screens/settings.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingController(),
      child: MaterialApp(
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
      ),
    );
  }
}
