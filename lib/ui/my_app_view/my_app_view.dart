import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_basic_structure/app/app.router.dart';
import 'package:flutter_basic_structure/util/themes.dart';
import 'my_app_viewmodel.dart';

class MyAppView extends StatelessWidget {
  // Property to store the initial theme mode
  final AdaptiveThemeMode initialThemeMode;

  // Constructor for MyAppView widget
  const MyAppView({
    super.key,
    required this.initialThemeMode,
  });

  // Build method for MyAppView widget
  @override
  Widget build(BuildContext context) {
    // Use ViewModelBuilder to create a non-reactive widget
    return ViewModelBuilder.nonReactive(
      // Provide the ViewModel instance using viewModelBuilder
      viewModelBuilder: () => MyAppViewModel(),

      // Callback function to execute when the ViewModel is ready
      onViewModelReady: (viewModel) => viewModel.routeUser(),

      // Builder function to create the UI based on ViewModel state
      builder: (context, viewModel, child) {
        // Use AdaptiveTheme widget for theme management
        return AdaptiveTheme(
          dark: darkTheme,
          light: lightTheme,
          initial: initialThemeMode,
          builder: (theme, darkTheme) {
            // Return MaterialApp widget with specified configurations
            return MaterialApp(
              title: "Demo code",
              initialRoute: viewModel.initialRoute,
              locale: context.locale,
              theme: theme,
              darkTheme: darkTheme,
              localizationsDelegates: context.localizationDelegates,
              debugShowCheckedModeBanner: false,
              supportedLocales: const [
                Locale("en"),
              ],
              navigatorKey: StackedService.navigatorKey,
              onGenerateRoute: StackedRouter().onGenerateRoute,
              navigatorObservers: [
                StackedService.routeObserver,
              ],
            );
          },
        );
      },
    );
  }
}
