// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryDto _$SummaryDtoFromJson(Map<String, dynamic> json) {
  return SummaryDto(
    summaryId: json['summary_id'] as String,
    startedAt: json['started_at'] == null
        ? null
        : DateTime.parse(json['started_at'] as String),
    endedAt: json['ended_at'] == null
        ? null
        : DateTime.parse(json['ended_at'] as String),
    status: json['status'] as String,
    output: json['output'] as String,
    model: json['model'] as String,
    params: json['params'] == null
        ? null
        : SummaryParamsDto.fromJson(json['params'] as Map<String, dynamic>),
  );
}
