import 'package:jizt_api/src/dto/summary_params_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'summary_request_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class SummaryRequestDto {
  final String? source;
  final String? model;
  final SummaryParamsDto? params;

  SummaryRequestDto({this.source, this.model, this.params});

  factory SummaryRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SummaryRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryRequestDtoToJson(this);
}
