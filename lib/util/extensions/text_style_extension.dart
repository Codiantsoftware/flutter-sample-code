import 'package:flutter/material.dart';

extension ExtensionOndouble on TextStyle {
  TextStyle get regular => merge(const TextStyle(fontWeight: FontWeight.w400));
  TextStyle get medium => merge(const TextStyle(fontWeight: FontWeight.w500));
  TextStyle get semiBold => merge(const TextStyle(fontWeight: FontWeight.w600));
  TextStyle get bold => merge(const TextStyle(fontWeight: FontWeight.w700));
  TextStyle get extraBold =>
      merge(const TextStyle(fontWeight: FontWeight.w900));
}
