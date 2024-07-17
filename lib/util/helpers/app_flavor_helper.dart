import '../enums/app_flavor_enums.dart';

class AppFlavorHelper {
  static AppFlavor? currentAppFlavor;

  static setCurrentAppFlavor(AppFlavor flavor) => currentAppFlavor = flavor;

  static Uri getBaseApiUrl() {
    String baseUrl = "";
    if (currentAppFlavor == AppFlavor.dev) {
      baseUrl = "https://node-api-demo.codiantdev.com/api";
    } else if (currentAppFlavor == AppFlavor.qa) {
      baseUrl = "";
    } else {
      baseUrl = "";
    }
    return Uri.parse(baseUrl);
  }
}
