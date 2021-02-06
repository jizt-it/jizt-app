import 'package:json_annotation/json_annotation.dart';

part 'summary_dto.g.dart';

@JsonSerializable(createToJson: false)
class SummaryDto {
  final DateTime startedAt;
  final DateTime endedAt;
  final String status;
  final String output;

  SummaryDto(this.startedAt, this.endedAt, this.status, this.output);

  factory SummaryDto.fromJson(Map<String, dynamic> json) =>
      _$SummaryDtoFromJson(json);
}
