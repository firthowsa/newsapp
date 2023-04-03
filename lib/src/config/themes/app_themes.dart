import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.black,
      splashColor: Colors.transparent,
      fontFamily: 'IBM',
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    );
  }

  static ThemeData get dark {
    final ThemeData darkTheme = ThemeData.dark();
    return darkTheme.copyWith(
      primaryColor: Colors.black38,
      indicatorColor: Color(0xFF807A6B),
      primaryIconTheme: darkTheme.primaryIconTheme.copyWith(
        color: Colors.green,
        size: 20,
      ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFFFF8E1)),
      // cursorColor: Colors.green,
    );
  }


}
