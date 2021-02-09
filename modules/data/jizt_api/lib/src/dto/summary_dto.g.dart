// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryDto _$SummaryDtoFromJson(Map<String, dynamic> json) {
  return SummaryDto(
    json['started_at'] == null
        ? null
        : DateTime.parse(json['started_at'] as String),
    json['ended_at'] == null
        ? null
        : DateTime.parse(json['ended_at'] as String),
    json['status'] as String,
    json['output'] as String,
  );
}
