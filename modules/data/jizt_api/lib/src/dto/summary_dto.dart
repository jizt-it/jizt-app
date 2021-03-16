import 'package:jizt_api/src/dto/dtos.dart';
import 'package:json_annotation/json_annotation.dart';

part 'summary_dto.g.dart';

@JsonSerializable(createToJson: false)
class SummaryDto {
  @JsonKey(name: 'summary_id')
  final String? summaryId;
  @JsonKey(name: 'started_at')
  final DateTime? startedAt;
  @JsonKey(name: 'ended_at')
  final DateTime? endedAt;
  final String? status;
  final String? output;
  final String? model;
  final SummaryParamsDto? params;

  SummaryDto(
      {this.summaryId,
      this.startedAt,
      this.endedAt,
      this.status,
      this.output,
      this.model,
      this.params});

  factory SummaryDto.fromJson(Map<String, dynamic> json) =>
      _$SummaryDtoFromJson(json);
}
