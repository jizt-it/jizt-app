// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryDto _$SummaryDtoFromJson(Map<String, dynamic> json) {
  return SummaryDto(
    json['startedAt'] == null
        ? null
        : DateTime.parse(json['startedAt'] as String),
    json['endedAt'] == null ? null : DateTime.parse(json['endedAt'] as String),
    json['status'] as String,
    json['output'] as String,
  );
}
