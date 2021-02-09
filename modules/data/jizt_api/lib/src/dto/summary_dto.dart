import 'package:json_annotation/json_annotation.dart';

part 'summary_dto.g.dart';

@JsonSerializable(createToJson: false)
class SummaryDto {
  @JsonKey(name: 'started_at')
  final DateTime startedAt;
  @JsonKey(name: 'ended_at')
  final DateTime endedAt;
  final String status;
  final String output;

  SummaryDto(this.startedAt, this.endedAt, this.status, this.output);

  factory SummaryDto.fromJson(Map<String, dynamic> json) =>
      _$SummaryDtoFromJson(json);
}
