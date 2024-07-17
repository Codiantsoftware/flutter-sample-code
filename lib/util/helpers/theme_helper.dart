import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/color_constants.dart';
import '../constants/string_constants.dart';
import '../others/size_config.dart';

class ThemeHelper {
  bool isDarkMode = false;
  BuildContext context;
  SizeConfig sizeConfig = SizeConfig();

  ThemeHelper({required this.context}) {
    sizeConfig.init(context);
    isDarkMode = context.isDarkMode;
  }

  ThemeData get themeData => Theme.of(context);

  TextStyle textSizeSmall({
    FontWeight fontWeight = FontWeight.normal,
    Color color = blackColor,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: sizeConfig.textSizeSmall,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  TextStyle textSizeVerySmall({
    FontWeight fontWeight = FontWeight.normal,
    Color color = blackColor,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: sizeConfig.textSizeVerySmall,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  TextStyle textSizeMedium({
    FontWeight fontWeight = FontWeight.normal,
    Color color = blackColor,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: sizeConfig.textSizeMedium,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  TextStyle textSizeLarge({
    FontWeight fontWeight = FontWeight.normal,
    Color color = blackColor,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: sizeConfig.textSizeLarge,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  TextStyle textSizeHeading({
    FontWeight fontWeight = FontWeight.normal,
    Color color = blackColor,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: sizeConfig.textSizeHeading,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  TextStyle textSizeXLarge({
    FontWeight fontWeight = FontWeight.normal,
    Color color = blackColor,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: sizeConfig.textSizeXLarge,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  TextStyle textCustomSize({
    FontWeight fontWeight = FontWeight.normal,
    double? fontSize,
    Color color = blackColor,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }
}
