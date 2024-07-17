import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:json_to_type/json_to_type.dart';

// Use Freezed package for code generation and immutable classes
part 'task_successful_response.freezed.dart';
// Use JsonSerializable to generate JSON serialization/deserialization code
part 'task_successful_response.g.dart';

@freezed
@JsonToType()
class TaskSuccessfulResponse with _$TaskSuccessfulResponse {
  /// Constructor for a successful response with a message
  const factory TaskSuccessfulResponse.success(
    @JsonKey(name: "message", defaultValue: "") String message,
  ) = _TaskSuccessfulResponse;

  /// Constructor for an error response with status and message
  const factory TaskSuccessfulResponse.error(int status, String message) = _TaskSuccessfulResponseError;

  /// Factory method to create an instance from JSON data
  factory TaskSuccessfulResponse.fromJson(Map<String, dynamic> json) => _$TaskSuccessfulResponseFromJson(json);
}
