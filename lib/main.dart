import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_catalog/utils/routs.dart';

import 'package:flutter_catalog/screens/homeScreen.dart';
import 'package:flutter_catalog/screens/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomeScreen(),
      themeMode: ThemeMode.system,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily
          // textTheme: GoogleFonts.latoTextTheme()
          ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/",
      routes: {
        "/": (contex) => LoginScreen(),
        MyRoutes.homeRoute: (contex) => HomeScreen(),
        MyRoutes.loginRoute: (contex) => LoginScreen(),
      },
    );
  }
}
