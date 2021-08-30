import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      // fontFamily: GoogleFonts.lato().fontFamily,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: cream,
      buttonColor: darkBluish,
      accentColor: darkBluish,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.deepPurple,
      // fontFamily: GoogleFonts.lato().fontFamily,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCream,
      buttonColor: lightBluish,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme.copyWith(
            headline6:
                context.textTheme.headline6!.copyWith(color: Colors.white)),
      ));

  // * Custom colors
  static Color cream = Color(0xfff5f5f5);
  static Color darkCream = Vx.gray900;
  static Color darkBluish = Color(0xff403b58);
  static Color lightBluish = Vx.indigo500;
}
