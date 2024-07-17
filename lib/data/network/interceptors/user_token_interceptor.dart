import 'dart:async';
import 'package:chopper/chopper.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../dtos/auth_response.dart';

/// Custom interceptor to add user token to outgoing requests
class UserTokenInterceptor extends RequestInterceptor {
  // Logger instance for logging information
  final log = getLogger("UserTokenInterceptor");

  /// Override method to modify the request before it is sent
  @override
  FutureOr<Request> onRequest(Request request) async {
    /// Access the user's authentication response data using the locator
    final user = locator<AuthResponseData>();
    var userAccessToken = user.accessToken;

    /// Create a copy of the request headers to avoid mutation
    Map<String, String> headers = Map.from(request.headers);

    /// Check if user has a valid access token
    if (user.accessToken.isNotEmpty) {
      // If valid, add the Authorization header with the Bearer token
      Map<String, String> mapOfHeaders = {
        "Authorization": "Bearer $userAccessToken",
      };
      headers.addAll(mapOfHeaders);
    }
    log.i(
        "<---\nAPI ${request.url}\nUser token $userAccessToken\nUser refresh $userAccessToken \nRequest body ${request.body}\nHeaders $headers\nQuery params ${request.parameters}\nQuery Multipart ${await request.toMultipartRequest()}---------------------------------------------------------------->");

    // Return the modified request with updated headers
    return request.copyWith(headers: headers);
  }
}
