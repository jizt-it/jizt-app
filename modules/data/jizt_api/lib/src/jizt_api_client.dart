import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jizt_api/jizt_api.dart';

import 'parser/json_parser.dart';

/// A Dart API Client for the Jizt REST API.
abstract class JiztApiClient {
  Future<SummaryJobDto> requestSummary(SummaryRequestDto request);

  Future<SummaryDto> getSummary(String id);
}

class JiztApiClientImpl extends JiztApiClient {
  JiztApiClientImpl({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _authority = '35.186.248.210';

  final http.Client _httpClient;

  /// POST /v1/summaries/plain-text
  @override
  Future<SummaryJobDto> requestSummary(SummaryRequestDto request) async {
    final uri = Uri.http(_authority, '/v1/summaries/plain-text');

    http.Response response;
    try {
      response = await _httpClient.post(uri,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(request.toJson()));
    } on Exception {
      throw HttpException();
    }

    if (response.statusCode != 202) {
      throw HttpRequestFailure(response.statusCode);
    }

    return SummaryJobParser().parseFromJson(response.body);
  }

  /// GET /v1/summaries/plain-text/{id}
  @override
  Future<SummaryDto> getSummary(String id) async {
    final uri = Uri.http(_authority, '/v1/summaries/plain-text/$id');
    http.Response response;
    try {
      response = await _httpClient.get(uri);
    } on Exception {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    return SummaryParser().parseFromJson(response.body);
  }
}
