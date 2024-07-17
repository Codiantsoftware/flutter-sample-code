import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_to_type/json_to_type.dart';
import '../../../app/app.locator.dart';
import '../../local/preference_keys.dart';

// Use Freezed and JsonSerializable for code generation and serialization/deserialization
part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
@JsonToType()
class AuthResponse with _$AuthResponse {
  /// Constructor for a successful response with data
  @JsonSerializable()
  const factory AuthResponse.success(
      @JsonKey(name: "data", defaultValue: AuthResponseData.init) AuthResponseData data) = _AuthResponse;

  /// Constructor for an error response with status and message
  const factory AuthResponse.error(int status, String message) = _AuthResponseError;

  /// Factory method to create an instance from JSON data
  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}

/// Freezed class representing the data within the authentication response
@freezed
class AuthResponseData with _$AuthResponseData {
  /// Constructor with default values for each field
  const factory AuthResponseData(
    @JsonKey(name: "id", defaultValue: 0) int id,
    @JsonKey(name: "firstName", defaultValue: "") String firstName,
    @JsonKey(name: "lastName", defaultValue: "") String lastName,
    @JsonKey(name: "phoneNumber", defaultValue: "") String phoneNumber,
    @JsonKey(name: "email", defaultValue: "") String email,
    @JsonKey(name: "token", defaultValue: "") String accessToken,
  ) = _AuthResponseData;

  /// Factory method to create an instance with initial default values
  static AuthResponseData init() => AuthResponseData.fromJson({});

  /// Method to set user response in the application
  static setUserResponse(AuthResponseData auth) async {
    locator.unregister<AuthResponseData>();
    locator.registerSingleton<AuthResponseData>(auth);
    await locator<SharedPreferences>().setString(
      PreferenceKeys.USERRESPONSE.text,
      json.encode(auth),
    );
  }

  /// Method to get user response from the application
  static Future<AuthResponseData> getUserResponse() async {
    var data = locator<SharedPreferences>().getString(PreferenceKeys.USERRESPONSE.text);
    return data != null ? AuthResponseData.fromJson(json.decode(data)) : AuthResponseData.fromJson({});
  }

  /// Factory method to create an instance from JSON data
  factory AuthResponseData.fromJson(Map<String, dynamic> json) => _$AuthResponseDataFromJson(json);
}
