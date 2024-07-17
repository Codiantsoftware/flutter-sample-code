import 'dart:io';

import '../constants/constants.dart';
import '../exceptions/failures/failure.dart';

enum NetworkStatus {
  SocketStatus,
  CommonStatus,
}

extension ObjectExtension on Object {
  Failure handleException() {
    if (this is Exception) {
      if (this is SocketException) {
        return Failure(
          NetworkStatus.SocketStatus.index,
          "Please check internet connection",
        );
      }
      return Failure(NetworkStatus.CommonStatus.index, commonNetworkMsg);
    }
    return Failure(NetworkStatus.CommonStatus.index, commonNetworkMsg);
  }
}
