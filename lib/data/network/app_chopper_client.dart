import 'package:chopper/chopper.dart';
import 'package:http/http.dart';
import 'package:flutter_basic_structure/util/helpers/app_flavor_helper.dart';
import '../../util/converter/json_to_type_converter.dart';
import 'JWTAuthenticator.dart';
import 'api_services/auth_service.dart';
import 'interceptors/user_token_interceptor.dart';

/// Custom ChopperClient for the application
class AppChopperClient extends ChopperClient {
  AppChopperClient({Client? httpClient})
      : super(
          /// Setting the base URL for ChopperClient using the AppFlavorHelper
          baseUrl: AppFlavorHelper.getBaseApiUrl(),

          /// Adding interceptors for handling user tokens
          interceptors: [
            UserTokenInterceptor(),
          ],

          /// Using a custom converter for JSON to Dart object conversion
          converter: JsonToTypeConverter(),

          /// Authenticator for handling JWT authentication
          authenticator: JWTAuthenticator(),

          /// Registering Chopper services, in this case, AuthService
          services: [
            AuthService.create(),
          ],
        );
}
