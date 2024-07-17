/// Importing necessary packages and files
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_basic_structure/ui/home_view/home_view.dart';

/// Importing network-related files
import '../data/network/app_chopper_client.dart';
import '../data/network/dtos/auth_response.dart';
import '../data/repos/auth_repo_impl.dart';

/// Importing domain-related files
import '../domain/repos/auth.dart';

/// Importing UI views
import '../ui/signup_view/sign_up_view.dart';
import '../ui/login_view/login_view.dart';

/// Importing helper class
import '../util/helpers/app_state_helper.dart';

/// StackedApp annotation to define routes and dependencies
@StackedApp(
  routes: [
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: HomeView),
  ],
  dependencies: [
    /// Presolve for SharedPreferences
    Presolve(
      classType: SharedPreferences,
      presolveUsing: SharedPreferences.getInstance,
    ),

    /// Lazy Singleton dependencies
    LazySingleton(
      classType: NavigationService,
    ),
    LazySingleton(
      classType: DialogService,
    ),
    LazySingleton(
      classType: SnackbarService,
    ),
    LazySingleton(
      classType: AppStateManager,
    ),
    LazySingleton(
      classType: AppChopperClient,
    ),

    /// Presolve for AuthResponseData
    Presolve(
      classType: AuthResponseData,
      presolveUsing: AuthResponseData.getUserResponse,
    ),

    /// Factory dependency for Auth
    Factory(
      classType: AuthImpl,
      asType: AuthRepo,
    ),
  ],
  logger: StackedLogger(),
)
class App {}
