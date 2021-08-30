import 'package:flutter/material.dart';

import 'package:flutter_catalog/utils/routs.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import 'package:flutter_catalog/screens/homeScreen.dart';
import 'package:flutter_catalog/screens/loginScreen.dart';
import 'package:flutter_catalog/screens/cartScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (contex) => LoginScreen(),
        MyRoutes.homeRoute: (contex) => HomeScreen(),
        MyRoutes.loginRoute: (contex) => LoginScreen(),
        MyRoutes.cartRoute: (context) => CartScreen()
      },
    );
  }
}
