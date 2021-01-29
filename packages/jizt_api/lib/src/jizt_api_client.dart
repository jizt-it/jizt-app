import 'dart:convert';

import 'package:http/http.dart' as http;

import '../jizt_api.dart';
import 'parsers/json_parser.dart';

/// A Dart API Client for the Jizt REST API.
class JiztApiClient {
  JiztApiClient({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _authority = '35.186.248.210';

  final http.Client _httpClient;

  /// POST /v1/summaries/plain-text
  Future<SummaryJob> requestSummary(SummaryRequest summaryRequest) async {
    final uri = Uri.http(_authority, '/v1/summaries/plain-text');

    http.Response response;
    try {
      response = await _httpClient.post(uri,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(summaryRequest.toJson()));
    } on Exception {
      throw HttpException();
    }

    if (response.statusCode != 202) {
      throw HttpRequestFailure(response.statusCode);
    }

    return SummaryJobParser().parseFromJson(response.body);
  }

  /// GET /v1/summaries/plain-text/{id}
  Future<Summary> getSummary(double jobId) async {
    final uri = Uri.http(
        _authority, '/v1/summaries/plain-text/${jobId.toStringAsFixed(0)}');
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
