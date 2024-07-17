import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants/constants.dart';

final lightTheme = ThemeData.light().copyWith(
  focusColor: Colors.white,
  // buttonColor: Colors.grey.shade300,
  iconTheme: const IconThemeData(size: 10),
  primaryIconTheme: const IconThemeData(
    size: 18.0,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: TextStyle(
        color: Colors.black,
        fontFamily: getFontFamily(),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        TextStyle(
          color: Colors.black,
          fontFamily: getFontFamily(),
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
      gapPadding: 0,
    ),
    hintStyle: TextStyle(
      fontFamily: getFontFamily(),
    ),
  ),
);

final darkTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  ),
  primaryIconTheme: const IconThemeData(
    color: Colors.white,
    size: 18.0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        TextStyle(
          color: Colors.black,
          fontFamily: getFontFamily(),
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
      gapPadding: 0,
    ),
    hintStyle: TextStyle(
      fontFamily: getFontFamily(),
    ),
  ),
);
