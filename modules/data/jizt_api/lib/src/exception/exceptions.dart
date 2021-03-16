/// Thrown if an exception occurs while making an `http` request.
class HttpException implements Exception {
  final String _message;

  const HttpException([String? message]) : _message = message ?? "";

  @override
  String toString() => _message;
}

/// Thrown if an `http` request returns a non-20x status code.
class HttpRequestFailure implements Exception {
  const HttpRequestFailure(this.statusCode);

  /// The status code of the response.
  final int statusCode;

  @override
  String toString() => statusCode.toString();
}

/// Thrown if an exception occurs while decoding the response body.
class JsonDecodeException implements Exception {}

/// Thrown is an error occurs while deserializing the response body.
class JsonDeserializationException implements Exception {
  String message = "";

  JsonDeserializationException(this.message);

  @override
  String toString() => message;
}
