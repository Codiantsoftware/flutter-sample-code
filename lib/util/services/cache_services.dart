import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheServices {
  SharedPreferences? sharedPreferences;
  FlutterSecureStorage? flutterSecureStorage;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    flutterSecureStorage = const FlutterSecureStorage();
  }

  Future<bool> storeInt({
    required String key,
    required int value,
  }) =>
      sharedPreferences!.setInt(key, value);

  Future<bool> storeBool({
    required String key,
    required bool value,
  }) =>
      sharedPreferences!.setBool(key, value);

  Future<bool> storeDouble({
    required String key,
    required double value,
  }) =>
      sharedPreferences!.setDouble(key, value);

  Future<bool> storeString({
    required String key,
    required String value,
  }) =>
      sharedPreferences!.setString(key, value);

  Future<bool> storeStringList({
    required String key,
    required List<String> value,
  }) =>
      sharedPreferences!.setStringList(key, value);

  Future<bool> storeMap({
    required String key,
    required Map<String, dynamic> value,
  }) =>
      sharedPreferences!.setString(key, jsonEncode(value));

  Future<void> storeStringInSecureStorage({
    required String key,
    required String value,
  }) =>
      flutterSecureStorage!.write(key: key, value: value);

  Future<void> storeMapInSecureStorage({
    required String key,
    required Map<String, dynamic> value,
  }) =>
      flutterSecureStorage!.write(key: key, value: jsonEncode(value));

  Future<bool> delete({required String key}) => sharedPreferences!.remove(key);

  Future<void> deleteFromSecureStorage({required String key}) =>
      flutterSecureStorage!.delete(key: key);

  int? getInt({required String key}) => sharedPreferences!.getInt(key);

  bool? getBool({required String key}) => sharedPreferences!.getBool(key);

  double? getDouble({required String key}) => sharedPreferences!.getDouble(key);

  String? getString({required String key}) => sharedPreferences!.getString(key);

  Future<String?> getStringFromSecureStorage({required String key}) =>
      flutterSecureStorage!.read(key: key);

  Future<Map<String, dynamic>?> getMapFromSecureStorage(
      {required String key}) async {
    return jsonDecode((await flutterSecureStorage!.read(key: key) ?? ""));
  }

  Map<String, dynamic>? getMap({required String key}) =>
      jsonDecode(sharedPreferences!.getString(key) ?? "");

  List<String>? getStringList({required String key}) =>
      sharedPreferences!.getStringList(key);

  void clearCache() {
    sharedPreferences!.clear();
    flutterSecureStorage!.deleteAll();
  }
}
