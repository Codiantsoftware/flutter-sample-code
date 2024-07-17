import 'package:flutter_basic_structure/data/network/dtos/task_successful_response.dart';
import 'package:dartz/dartz.dart';
import '../../data/network/dtos/auth_response.dart';
import '../../util/exceptions/failures/failure.dart';

/// Abstract class defining the contract for authentication repository
abstract class AuthRepo {
  /// Method for user login, returning either AuthResponseData on success or Failure on error
  Future<Either<Failure, AuthResponseData>> login(Map<String, dynamic> body);

  /// Method for user registration, returning either TaskSuccessfulResponse on success or Failure on error
  Future<Either<Failure, TaskSuccessfulResponse>> register(Map<String, dynamic> body);

  /// Method for user logout, returning either TaskSuccessfulResponse on success or Failure on error
  Future<Either<Failure, TaskSuccessfulResponse>> logout();
}
