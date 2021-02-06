import 'package:json_annotation/json_annotation.dart';

part 'summary_request_dto.g.dart';

@JsonSerializable()
class SummaryRequestDto {
  final String source;

  SummaryRequestDto({this.source});

  factory SummaryRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SummaryRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryRequestDtoToJson(this);
}
