import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      // fontFamily: GoogleFonts.lato().fontFamily,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);

  // * Custom colors
  static Color cream = Color(0xfff5f5f5);
  static Color darkBluish = Color(0xff403b58);
}
