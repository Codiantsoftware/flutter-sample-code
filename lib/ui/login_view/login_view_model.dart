import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_basic_structure/app/app.router.dart';
import '../../app/app.locator.dart';
import '../../domain/repos/auth.dart';
import '../../util/constants/constants.dart';

class LoginViewModel extends BaseViewModel {
  // Instances for navigation and snackBar services
  final navigationService = locator<NavigationService>();
  final snackBarService = locator<SnackbarService>();

  // Text editing controllers for email and password fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Repository for authentication operations
  final authRepo = locator<AuthRepo>();

  // GlobalKey for the login form
  final formKey = GlobalKey<FormState>();

  // Boolean to toggle password visibility
  bool isShowPassword = true;

  // Method to toggle password visibility
  void passwordIsVisible() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  // Asynchronous method to perform login action
  Future<void> loginAction() async {
    // Validate the form using the form key
    if (formKey.currentState!.validate()) {
      // Hide the keyboard
      hideKeyBoard();

      // Set ViewModel state as busy during the login process
      setBusy(true);

      // Perform login operation and await the response
      final response = await authRepo.login(await _getRequestForLogin());

      response.fold(
        // On left response (error), show a snackBar with the error message
        (leftResponse) {
          snackBarService.showSnackbar(message: leftResponse.errorMsg);
        },
        // On right response (success), navigate to the home view
        (res) async {
          navigationService.navigateTo(Routes.homeView);
        },
      );

      setBusy(false);
      // Notify listeners to update the UI
      notifyListeners();
    }
  }

  // Method to navigate to the sign-up view
  void navigateToSignUp() {
    navigationService.navigateTo(Routes.signUpView);
  }

  // Method to handle actions for features that are not yet available
  void featureNotAvailableAction() {
    if (!snackBarService.isSnackbarOpen) {
      snackBarService.showSnackbar(message: "feature_not_available".tr());
    }
  }

  // Private method to create the login request payload
  Future<Map<String, dynamic>> _getRequestForLogin() async {
    Map<String, dynamic> request = {};
    request['emailOrMobile'] = emailController.text.toLowerCase();
    request['password'] = passwordController.text;
    request['deviceType'] = deviceType;
    return request;
  }
}
