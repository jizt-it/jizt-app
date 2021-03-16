// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryRequestDto _$SummaryRequestDtoFromJson(Map<String, dynamic> json) {
  return SummaryRequestDto(
    source: json['source'] as String?,
    model: json['model'] as String?,
    params: json['params'] == null
        ? null
        : SummaryParamsDto.fromJson(json['params'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SummaryRequestDtoToJson(SummaryRequestDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source);
  writeNotNull('model', instance.model);
  writeNotNull('params', instance.params);
  return val;
}
