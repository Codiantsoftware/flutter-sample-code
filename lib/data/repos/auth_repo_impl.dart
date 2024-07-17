import 'package:dartz/dartz.dart';
import 'package:flutter_basic_structure/data/network/dtos/task_successful_response.dart';
import 'package:flutter_basic_structure/util/extensions/object_extension.dart';
import 'package:flutter_basic_structure/util/extensions/string_extension.dart';
import '../../app/app.locator.dart';
import '../../app/app.logger.dart';
import '../../domain/repos/auth.dart';
import '../../util/exceptions/failures/failure.dart';
import '../network/api_services/auth_service.dart';
import '../network/app_chopper_client.dart';
import '../network/dtos/auth_response.dart';

/// Class implementing AuthRepo interface
class AuthImpl extends AuthRepo {
  /// Instances of necessary services and logger
  final authService = locator<AppChopperClient>().getService<AuthService>();
  final log = getLogger("AuthImpl");

  /// Implementation of login method from AuthRepo interface
  @override
  Future<Either<Failure, AuthResponseData>> login(Map<String, dynamic> body) async {
    try {
      var response = await authService.loginApi(body);

      /// Handling cases where the response body is null
      if (response.body == null) {
        return Left(Failure(-1, response.error.toString().getResponseMessage()));
      }

      /// Mapping the response to either success or error
      return response.body!.map(success: (data) async {
        log.i("Login Response ${response.body}");
        await AuthResponseData.setUserResponse(data.data);
        return Right(data.data);
      }, error: (error) {
        return Left(Failure(error.status, error.message));
      });
    } catch (e) {
      return Left(e.handleException());
    }
  }

  /// Implementation of register method from AuthRepo interface
  @override
  Future<Either<Failure, TaskSuccessfulResponse>> register(Map<String, dynamic> body) async {
    try {
      var response = await authService.signUpApi(body);

      /// Handling cases where the response body is null
      if (response.body == null) {
        return Left(Failure(-1, response.error.toString().getResponseMessage()));
      }

      /// Mapping the response to either success or error
      return response.body!.map(success: (data) async {
        return Right(data);
      }, error: (error) {
        return Left(Failure(error.status, error.message));
      });
    } catch (e) {
      log.e("error $e");
      return Left(e.handleException());
    }
  }

  /// Implementation of logout method from AuthRepo interface
  @override
  Future<Either<Failure, TaskSuccessfulResponse>> logout() async {
    try {
      var response = await authService.logoutApi();

      /// Handling cases where the response body is null
      if (response.body == null) {
        return Left(Failure(-1, response.error.toString().getResponseMessage()));
      }

      /// Mapping the response to either success or error
      return response.body!.map(success: (data) async {
        return Right(data);
      }, error: (error) {
        return Left(Failure(error.status, error.message));
      });
    } catch (e) {
      log.e("error $e");
      return Left(e.handleException());
    }
  }
}
