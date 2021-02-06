import 'package:json_annotation/json_annotation.dart';

part 'summary_job_dto.g.dart';

@JsonSerializable(createToJson: false)
class SummaryJobDto {
  @JsonKey(name: 'job_id')
  final String jobId;

  SummaryJobDto({this.jobId});

  factory SummaryJobDto.fromJson(Map<String, dynamic> json) =>
      _$SummaryJobDtoFromJson(json);
}
