import 'package:flutter/material.dart';
import 'package:pos/controller/settings_controller.dart';
import 'package:pos/controller/sidenav_controller.dart';
import 'package:pos/screens/settings.dart';
import 'package:pos/webview/main_screen/mainscreen.dart';
import 'package:provider/provider.dart';

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
        home: MainScreen(),
      ),
    );
  }
}
