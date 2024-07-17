import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../data/network/dtos/auth_response.dart';

class MyAppViewModel extends BaseViewModel {
  // Instance for navigation service
  final navigationService = locator<NavigationService>();

  // Instance for snackbar service
  final snackBarService = locator<SnackbarService>();

  // Initial route for the application
  var initialRoute = Routes.loginView;

  // Instance for holding user authentication data
  final user = locator<AuthResponseData>();

  // Asynchronous method to determine the initial route based on user authentication
  Future<void> routeUser() async {
    if (user.accessToken.isNotEmpty) {
      // Set the initial route to home view if the user is authenticated
      initialRoute = Routes.homeView;
    } else {
      // Set the initial route to login view if the user is not authenticated
      initialRoute = Routes.loginView;
    }
  }
}
