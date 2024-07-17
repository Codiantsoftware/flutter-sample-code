import 'dart:async';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic_structure/util/constants/color_constants.dart';
import 'package:flutter_basic_structure/util/enums/app_flavor_enums.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_basic_structure/app/app.locator.dart';
import 'package:flutter_basic_structure/ui/my_app_view/my_app_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'util/constants/string_constants.dart';
import 'util/helpers/app_flavor_helper.dart';

Future<void> main() async {
  try {
    AppFlavorHelper.setCurrentAppFlavor(AppFlavor.dev);
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await EasyLocalization.ensureInitialized();
    await setupLocator();
    locator<SnackbarService>().registerSnackbarConfig(
      SnackbarConfig(
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: true,
        dismissDirection: DismissDirection.none,
        backgroundColor: purpleBlueColor,
        messageColor: whiteColor,
        borderRadius: 8,
        animationDuration: const Duration(seconds: 1),
      ),
    );
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    Future.delayed(const Duration(seconds: 2)).then((value) {
      FlutterNativeSplash.remove();
    });
    final initialThemeMode = (await AdaptiveTheme.getThemeMode()) ?? AdaptiveThemeMode.light;
    runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        useOnlyLangCode: true,
        fallbackLocale: const Locale('en'),
        path: easyLocalizationAssetPath,
        child: MyAppView(
          initialThemeMode: initialThemeMode,
        ),
      ),
    );
  } catch (e, stack) {
    if (kDebugMode) {
      print("main Screen ${e.toString()}");
    }
  }
}
