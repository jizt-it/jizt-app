import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jizt_api/jizt_api.dart';

import 'parser/json_parser.dart';

/// A Dart API Client for the Jizt REST API.
/// https://docs.api.jizt.it/
abstract class JiztApiClient {
  Future<SummaryDto> requestSummary(SummaryRequestDto request);

  Future<SummaryDto> getSummary(String id);
}

class JiztApiClientImpl extends JiztApiClient {
  JiztApiClientImpl({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'api.jizt.it';

  final http.Client _httpClient;

  /// POST /v1/summaries/plain-text
  @override
  Future<SummaryDto> requestSummary(SummaryRequestDto request) async {
    final uri = Uri.https(_baseUrl, '/v1/summaries/plain-text');
    final body = jsonEncode(request.toJson());
    print('--> POST ${uri.toString()}\n${body}');

    http.Response response;
    try {
      response = await _httpClient.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: body,
      );
    } on Exception {
      throw HttpException();
    }
    print(
        '<-- ${response.statusCode} POST ${uri.toString()}\n${response.body}');
    if (response.statusCode != 202) {
      throw HttpRequestFailure(response.statusCode);
    }

    return SummaryParser().parseFromJson(response.body);
  }

  /// GET /v1/summaries/plain-text/{id}
  @override
  Future<SummaryDto> getSummary(String id) async {
    final uri = Uri.https(_baseUrl, '/v1/summaries/plain-text/$id');
    print('--> GET ${uri.toString()}');

    http.Response response;
    try {
      response = await _httpClient.get(uri);
    } on Exception {
      throw HttpException();
    }
    print('<-- ${response.statusCode} GET ${uri.toString()}\n${response.body}');
    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    return SummaryParser().parseFromJson(response.body);
  }
}
