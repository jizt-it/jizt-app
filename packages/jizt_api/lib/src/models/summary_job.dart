import 'package:json_annotation/json_annotation.dart';

part 'summary_job.g.dart';

@JsonSerializable(createToJson: false)
class SummaryJob {
  @JsonKey(name: 'job_id')
  final double jobId;

  SummaryJob(this.jobId);

  factory SummaryJob.fromJson(Map<String, dynamic> json) =>
      _$SummaryJobFromJson(json);
}
