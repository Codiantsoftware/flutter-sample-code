import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget svgPictureWidget({
  required String path,
  Color? color,
  void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: SvgPicture.asset(
      path,
      color: color,
    ),
  );
}
