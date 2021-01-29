import 'package:json_annotation/json_annotation.dart';

part 'summary_request.g.dart';

@JsonSerializable()
class SummaryRequest {
  final String source;

  SummaryRequest(this.source);

  factory SummaryRequest.fromJson(Map<String, dynamic> json) =>
      _$SummaryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryRequestToJson(this);
}
