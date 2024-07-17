import 'dart:convert';

import 'package:chopper/chopper.dart';

import '../../app/app.logger.dart';
import '../../data/network/json_converter.dart';

class JsonToTypeConverter extends JsonConverter {
  final Map<Type, Function> typeToJsonFactoryMap = jsonConverters;
  final log = getLogger("JsonToTypeConverter");

  JsonToTypeConverter();

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return response.copyWith(
      body: fromJsonData<BodyType, InnerType>(response.body, typeToJsonFactoryMap[InnerType]),
    );
  }

  T fromJsonData<T, InnerType>(String jsonData, Function? jsonParser) {
    var jsonMap = json.decode(jsonData);

    /// Convert [type] from response to lower case to ensure it matches dto's constructors.
    if (jsonMap is Map<String, dynamic>) {
      if (jsonMap.containsKey('runtimeType')) {
        jsonMap.update("runtimeType", (value) => value.toString().toLowerCase());
      } else {
        if (jsonMap.containsKey('success')) {
          bool apiStatus = jsonMap['success'];
          jsonMap['runtimeType'] = apiStatus ? "success" : "error";
        }
        if (jsonMap.containsKey('data')) {
          jsonMap.addAll({"runtimeType": "success"});
        } else {
          final response = {'runtimeType': 'error'};
          if (!jsonMap.containsKey('status')) {
            response.addAll({'status': '-1'});
          }
          if (!jsonMap.containsKey('message')) {
            var errorMsg = '';
            if (jsonMap.containsKey('detail')) {
              errorMsg = jsonMap['detail'];
            } else {
              errorMsg = "Message not provided by server";
            }
            response.addAll({'message': errorMsg});
          }

          jsonMap.addAll(response);
        }
      }
    }

    try {
      if (jsonParser != null) {
        if (jsonMap is List) {
          return jsonMap.map((item) => jsonParser(item as Map<String, dynamic>) as InnerType).toList() as T;
        }

        return jsonParser(jsonMap);
      } else {
        return jsonMap;
      }
    } catch (e, s) {
      print(s.toString());
      return jsonMap;
    }
  }
}
