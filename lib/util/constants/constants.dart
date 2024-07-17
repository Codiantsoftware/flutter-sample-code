import 'dart:io' show Platform;
import 'package:flutter/material.dart';

const String commonNetworkMsg = "Something went wrong";

String deviceType = Platform.isAndroid ? "android" : "ios";

String? getFontFamily() {
  return Platform.isAndroid ? "Inter" : null;
}

void hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

EdgeInsets edgeInsetsHorizontalPadding15 = const EdgeInsets.symmetric(horizontal: 15);
