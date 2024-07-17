import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//This class is used to provide dimensions (eg. margins, padding, width & height) to our app, which are sized as
//per different screen resolutions

class SizeConfig {
  double screenWidth = 0;
  double screenWidthActual = 0;
  double screenHeight = 0;
  double screenHeightActual = 0;
  double blockSizeHorizontal = 0;
  double blockSizeVertical = 0;
  double _safeAreaHorizontal = 0;
  double _safeAreaVertical = 0;
  double safeBlockHorizontal = 0;
  double safeBlockVertical = 0;
  double textSizeVerySmall = 0;
  double textSizeSmall = 0;
  double textSizeMedium = 0;
  double textSizeLarge = 0;
  double textSizeHeading = 0;
  double textSizeXLarge = 0;
  double marginPadding20 = 0;
  double marginPadding10 = 0;
  double marginPadding5 = 0;
  double marginPadding2 = 0;
  double marginPadding3 = 0;
  double marginPadding37 = 0;
  double marginPadding35 = 0;
  double marginPadding15 = 0;
  double marginPadding29 = 0;
  double marginPadding40 = 0;
  double devicePixelRatio = 0;
  double marginPadding16 = 0;
  double marginPadding17 = 0;
  double marginPadding18 = 0;
  double marginPadding70 = 0;
  double separatorWidth = 0;
  double strokeWidth = 0;
  double inputBorderRadius = 0;
  double marginPadding85 = 0;
  double marginPadding50 = 0;
  double marginPadding65 = 0;
  double marginPadding28 = 0;
  double marginPadding4 = 0;
  double marginPadding24 = 0;
  double marginPadding13 = 0;
  double marginPadding100 = 0;
  double marginPadding8 = 0;
  double marginPadding14 = 0;
  double mapMarkerSize = 0;
  double googleMapPaddingTop = 0;
  double googleMapPaddingLeft = 0;

  void init(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    devicePixelRatio = mediaQueryData.devicePixelRatio;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        mediaQueryData.padding.left + mediaQueryData.padding.right;
    _safeAreaVertical =
        mediaQueryData.padding.top + mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    screenHeightActual = screenHeight - _safeAreaVertical;
    screenWidthActual = screenWidth - _safeAreaHorizontal;

    textSizeVerySmall = safeBlockHorizontal * 3.25; //for 12 pixel text-size
    textSizeSmall = safeBlockHorizontal * 4; //for 14 pixel text-size
    textSizeMedium = safeBlockHorizontal * 4.5; //for 16 pixel text-size
    textSizeLarge = safeBlockHorizontal * 5; //for 18 pixel text-size
    textSizeXLarge = safeBlockHorizontal * 6; //for 20 pixel text-size
    textSizeHeading = safeBlockHorizontal * 6.5; //for 24 pixel text-size

    separatorWidth = safeBlockHorizontal * 0.25; //approx 1 pixel
    strokeWidth = safeBlockHorizontal * 0.5; //approx 1.5 pixel
    inputBorderRadius = safeBlockHorizontal * 1.5; //approx 5 pixel
    marginPadding4 = safeBlockHorizontal * 1; //approx 5 pixel
    marginPadding8 = safeBlockHorizontal * 2; //approx 8 pixel
    marginPadding5 = safeBlockHorizontal * 1.5; //approx 5 pixel
    marginPadding10 = safeBlockHorizontal * 3; //approx 10 pixel
    marginPadding13 = safeBlockHorizontal * 3.5; //approx 13 pixel
    marginPadding14 = safeBlockHorizontal * 3.75; //approx 13 pixel
    marginPadding15 = safeBlockHorizontal * 4; //approx 15 pixel
    marginPadding16 = safeBlockHorizontal * 4.5; //approx 16 pixel
    marginPadding17 = safeBlockHorizontal * 4.8; //approx 17 pixel
    marginPadding18 = safeBlockHorizontal * 5; //approx 18 pixel
    marginPadding20 = safeBlockHorizontal * 6; //approx 20 pixel
    marginPadding24 = safeBlockHorizontal * 6.5; //approx 24 pixel
    marginPadding29 = safeBlockHorizontal * 8; //approx 29 pixel
    marginPadding35 = safeBlockHorizontal * 10; //approx 35 pixel
    marginPadding40 = safeBlockHorizontal * 11; //approx 40 pixel
    marginPadding70 = safeBlockHorizontal * 19.5; //approx 70 pixel
    marginPadding85 = safeBlockHorizontal * 23.5; //approx 85 pixel
    marginPadding50 = safeBlockHorizontal * 14; //approx 50 pixel
    marginPadding65 = safeBlockHorizontal * 18; //approx 65 pixel
    marginPadding28 = safeBlockHorizontal * 8; //approx 28 pixel
    marginPadding2 = safeBlockHorizontal * 0.5; //approx 2 pixel
    marginPadding37 = safeBlockHorizontal * 9;
    marginPadding3 = marginPadding2 + safeBlockHorizontal * 0.25;
    marginPadding100 = marginPadding50 + marginPadding50;
    mapMarkerSize = safeBlockHorizontal * 7; //approx 25 pixel

    googleMapPaddingTop = safeBlockVertical * 37;
    googleMapPaddingLeft = marginPadding10;
  }

  double get(double val) => safeBlockHorizontal * val;
}
