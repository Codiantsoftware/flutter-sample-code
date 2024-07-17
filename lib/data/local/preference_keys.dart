class PreferenceKeys {
  static const PreferenceKeys ACCESS_TOKEN = const PreferenceKeys._("ACCESS_TOKEN");

  /*SIGN IN KEYS*/
  static const PreferenceKeys USERRESPONSE = const PreferenceKeys._("USER_RESPONSE");


  final String text;
  const PreferenceKeys._(this.text);

  String getKey() => text;
}
