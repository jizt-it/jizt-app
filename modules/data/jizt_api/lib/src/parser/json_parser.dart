library json_parser;

import 'package:jizt_api/jizt_api.dart';

import 'object_decoder.dart';

export 'summary_id_parser.dart';
export 'summary_parser.dart';

abstract class JsonParser<T> {
  const JsonParser();

  Future<T> parseFromJson(String json);
}

abstract class JsonObjectParser<T> extends JsonParser<T> with ObjectDecoder<T> {
  const JsonObjectParser();

  @override
  Future<T> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    try {
      return fromJson(decoded);
    } catch (e) {
      throw JsonDeserializationException(e.toString());
    }
  }

  T fromJson(Map<String, dynamic> decoded);
}

abstract class JsonListParser<T> extends JsonParser<T> with ListDecoder<T> {
  const JsonListParser();

  @override
  Future<T> parseFromJson(String json) async {
    final decoded = decodeJsonList(json);
    try {
      return fromJson(decoded);
    } catch (e) {
      throw JsonDeserializationException(e.toString());
    }
  }

  T fromJson(List<dynamic> decoded);
}
