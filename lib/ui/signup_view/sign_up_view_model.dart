import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../data/network/dtos/auth_response.dart';
import '../../domain/repos/auth.dart';
import '../../util/constants/constants.dart';

class SignUpViewModel extends BaseViewModel {
  // Instances for navigation, snackBar services, and authentication repository
  final navigationService = locator<NavigationService>();
  final snackBarService = locator<SnackbarService>();
  final authRepo = locator<AuthRepo>();

  // Instance for holding user authentication data
  final user = locator<AuthResponseData>();

  // Text editing controllers for form input fields
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // GlobalKey for the sign-up form
  final formKey = GlobalKey<FormState>();

  // Boolean to toggle password visibility
  bool isShowPassword = true;

  // Method to toggle password visibility
  void passwordIsVisible() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  // Asynchronous method to perform sign-up action
  Future<void> signUpAction() async {
    // Validate the form using the form key
    if (formKey.currentState!.validate()) {
      // Hide the keyboard
      hideKeyBoard();

      // Set ViewModel state as busy during the sign-up process
      setBusy(true);

      // Perform sign-up operation and await the response
      final response = await authRepo.register(await _getRequestForRegister());

      // Handle the result of the sign-up operation
      response.fold(
        // On left response (error), show a snackBar with the error message
        (leftResponse) {
          snackBarService.showSnackbar(message: leftResponse.errorMsg);
        },
        // On right response (success), navigate back and show a success snackBar
        (res) async {
          navigationService.back();
          snackBarService.showSnackbar(message: res.message);
        },
      );

      // Reset ViewModel state from busy to not busy
      setBusy(false);

      // Notify listeners to update the UI
      notifyListeners();
    }
  }

  // Method to handle actions for features that are not yet available
  void featureNotAvailableAction() {
    if (!snackBarService.isSnackbarOpen) {
      snackBarService.showSnackbar(message: "feature_not_available".tr());
    }
  }

  // Method to navigate to the login view
  void navigateToLogin() {
    navigationService.clearStackAndShow(Routes.loginView);
  }

  // Private method to create the sign-up request payload
  Future<Map<String, dynamic>> _getRequestForRegister() async {
    Map<String, dynamic> request = {};
    request['firstName'] = firstNameController.text.trim();
    request['lastName'] = lastNameController.text.trim();
    request['phoneNumber'] = phoneNumberController.text;
    request['email'] = emailController.text.toLowerCase();
    request['password'] = passwordController.text;
    request['confirmPassword'] = passwordController.text;

    return request;
  }
}
