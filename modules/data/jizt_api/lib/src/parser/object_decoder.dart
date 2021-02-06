import 'dart:convert';

import 'package:jizt_api/jizt_api.dart';

import 'json_parser.dart';

mixin ObjectDecoder<T> on JsonParser<T> {
  Map<String, dynamic> decodeJsonObject(String json) {
    try {
      return jsonDecode(json) as Map<String, dynamic>;
    } on Exception {
      throw JsonDecodeException();
    }
  }
}

mixin ListDecoder<T> on JsonParser<T> {
  List<dynamic> decodeJsonList(String json) {
    try {
      return jsonDecode(json) as List<dynamic>;
    } on Exception {
      throw JsonDecodeException();
    }
  }
}
