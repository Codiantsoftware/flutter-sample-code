import 'package:chopper/chopper.dart';
import '../dtos/auth_response.dart';
import '../dtos/task_successful_response.dart';

/// Generating part file for AuthService
part 'auth_service.chopper.dart';

/// ChopperApi annotation to define base URL
@ChopperApi(baseUrl: "/v1/")
abstract class AuthService extends ChopperService {
  /// Factory method to create an instance of AuthService
  static AuthService create() => _$AuthService();

  /// Chopper Post method for signup API
  @Post(path: "signup")
  Future<Response<TaskSuccessfulResponse>> signUpApi(@Body() Map<String, dynamic> body);

  /// Chopper Post method for login API
  @Post(path: "login")
  Future<Response<AuthResponse>> loginApi(@Body() Map<String, dynamic> body);

  /// Chopper Get method for logout API
  @Get(path: "logout")
  Future<Response<TaskSuccessfulResponse>> logoutApi();
}
