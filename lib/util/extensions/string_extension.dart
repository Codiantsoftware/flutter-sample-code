import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  Widget get buildSvgPictureImage => SvgPicture.asset(this);

  String getResponseMessage() {
    Map<String, dynamic> error = json.decode(this);

    if (error.containsKey('message')) {
      if (error["message"] == "Unauthenticated.") {
        return "Session Expired";
      } else {
        return error["message"];
      }
    } else if (error.containsKey('field')) {
      return error["field"];
    } else if (error.containsKey('error')) {
      if (error['error'] is Map<String, dynamic>) {
        return error['error']["message"];
      } else if (error['error'] is List<Map<String, dynamic>>) {
        return error['error'][0]["message"];
      } else {
        return error["No Message from server."];
      }
    } else {
      return error["No Message from server."];
    }
  }
}
