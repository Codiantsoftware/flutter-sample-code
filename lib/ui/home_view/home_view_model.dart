import 'package:flutter_basic_structure/app/app.router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../data/network/dtos/auth_response.dart';
import '../../domain/repos/auth.dart';

class HomeViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final snackBarService = locator<SnackbarService>();
  final sharedPreferences = locator<SharedPreferences>();
  final authRepo = locator<AuthRepo>();
  final user = locator<AuthResponseData>();

  Future<void> logOutAction() async {
    setBusy(true);
    final response = await authRepo.logout();
    response.fold(
      (leftResponse) {
        snackBarService.showSnackbar(message: leftResponse.errorMsg);
      },
      (res) async {
        await sharedPreferences.clear();
        navigationService.clearStackAndShow(Routes.loginView);
        snackBarService.showSnackbar(message: res.message);
      },
    );
    setBusy(false);
    notifyListeners();
  }
}
