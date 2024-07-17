import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_basic_structure/app/app.router.dart';
import '../../app/app.locator.dart';
import '../../app/app.logger.dart';

// Custom JWT Authenticator class extending Chopper's Authenticator
class JWTAuthenticator extends Authenticator {
  // Logger instance for logging information
  final log = getLogger("JWTAuthenticator");

  /// Instance of NavigationService for handling navigation
  final navigationService = locator<NavigationService>();

  /// Instance of SnackbarService for displaying snackbars
  final snackBarService = locator<SnackbarService>();

  /// Override method to handle authentication on unauthorized responses
  @override
  FutureOr<Request?> authenticate(Request request, Response response, [Request? originalRequest]) async {
    String responseDetails = "";

    log.w("StatusCode: ${response.statusCode}, response ${response.body}");

    /// Handle unauthorized (401) response
    if (response.statusCode == 401) {
      // Navigate to the login view and clear the navigation stack
      await locator<SharedPreferences>().clear();
      navigationService.clearStackAndShow(Routes.loginView);
      return null;
    }

    /// Handle custom response codes if needed
    else if (response.statusCode == 426) {
      return null;
    } else if (response.statusCode == 500) {
      /// Extract the request body map
      final requestBodyMap = _bodyMap(request.body);

      /// Create a new map to modify the request body
      Map<String, dynamic> newBody = {};

      /// If request body map is not null, add its content to the new body map
      if (requestBodyMap != null) newBody.addAll(requestBodyMap);

      /// Update or add a 'retryCount' field in the new body map
      newBody.update(
        'retryCount',
        (v) {
          return ++v;
        },
        ifAbsent: () => 0,
      );

      /// If the 'retryCount' reaches 2, do not proceed with the request
      if (newBody['retryCount'] == 2) {
        return null;
      }

      /// Return the modified request with the updated body
      return request.copyWith(body: newBody);
    }

    /// Return null for other response codes
    return null;
  }

  /// Helper method to convert dynamic body to Map<String, dynamic>
  Map<String, dynamic>? _bodyMap(dynamic body) {
    if (body != null) return json.decode(body) as Map<String, dynamic>;
    return null;
  }
}
