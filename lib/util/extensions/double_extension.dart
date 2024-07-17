import 'package:flutter/widgets.dart';

extension ExtensionOndouble on double {
  double getFractionValue({required double fractionValue}) => this * fractionValue;

  Widget get buildVerticalSpace => SizedBox(height: this);
  Widget get buildHorizontalSpace => SizedBox(width: this);
}
