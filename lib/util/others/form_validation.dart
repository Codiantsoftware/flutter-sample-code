import 'package:easy_localization/easy_localization.dart';

class FormValidation {
  static bool validatePassword(String password) =>
      RegExp(r"(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&])^[a-zA-Z0-9!@#$%^&]{8,}$").hasMatch(password);

  static bool validatePhone(String phone) =>
      RegExp(r"^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$").hasMatch(phone);

  static bool validateEmail(String email) =>
      RegExp(r'^[a-zA-Z][a-zA-Z0-9._%+-]*@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$').hasMatch(email);

  static bool validateFullName(String fullName) => RegExp(r'^[a-zA-Z]+(?:\s[a-zA-Z]+)?$').hasMatch(fullName);

  static bool validateName(String name) => RegExp(r'^[a-zA-Z]{2,}$').hasMatch(name);

  static String? fullNameValidation(String? value) {
    if (value!.trim().isEmpty) {
      return "the_full_name_field_is_required".tr();
    } else if (value.length < 2 && validateFullName(value)) {
      return "The full name must be at least 2 characters.".tr();
    } else {
      return null;
    }
  }

  static String? firstNameValidation(String? value) {
    if (value!.trim().isEmpty) {
      return "error_msg_first_name".tr();
    } else if (value.trim().contains(' ')) {
      return "the_first_name_spaces_not_allowed".tr();
    } else if (value.length < 2) {
      return "error_msg_first_name_must_be_at_least_characters".tr();
    } else if (!validateName(value)) {
      return "error_msg_first_name_can_only_contain_alphabets".tr();
    } else {
      return null;
    }
  }

  static String? lastNameValidation(String? value) {
    if (value!.trim().isEmpty) {
      return "error_msg_last_name".tr();
    } else if (value.trim().contains(' ')) {
      return "the_last_name_spaces_not_allowed".tr();
    } else if (value.length < 2) {
      return "error_msg_last_name_must_be_at_least_characters".tr();
    } else if (!validateName(value)) {
      return "error_msg_last_name_can_only_contain_alphabets".tr();
    } else {
      return null;
    }
  }

  static String? emailValidation(String? value) {
    if (value!.trim().isEmpty) {
      return "error_msg_email".tr();
    } else if (value.isNotEmpty && !validateEmail(value)) {
      return "error_msg_email_validate".tr();
    } else {
      return null;
    }
  }

  static String? mobileValidation(String? value) {
    if (value!.trim().isEmpty) {
      return "error_msg_phone_number".tr();
    } else if (value.isNotEmpty && value.length < 10) {
      return 'The phone number must be between 10 digits.'.tr();
    } else {
      return null;
    }
  }

  static String? passwordValidation(String? value) {
    if (value!.trim().isEmpty) {
      return "error_msg_password".tr();
    } else if (value.isNotEmpty && !validatePassword(value)) {
      return "error_msg_password_validate".tr();
    } else {
      return null;
    }
  }
}
