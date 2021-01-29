// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return Summary(
    json['startedAt'] == null
        ? null
        : DateTime.parse(json['startedAt'] as String),
    json['endedAt'] == null ? null : DateTime.parse(json['endedAt'] as String),
    json['state'] as String,
    json['output'] as String,
  );
}
