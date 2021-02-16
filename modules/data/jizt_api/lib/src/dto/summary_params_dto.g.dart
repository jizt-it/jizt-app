// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_params_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryParamsDto _$SummaryParamsDtoFromJson(Map<String, dynamic> json) {
  return SummaryParamsDto(
    relativeMaxLength: (json['relative_max_length'] as num)?.toDouble(),
    relativeMinLength: (json['relative_min_length'] as num)?.toDouble(),
    doSample: json['do_sample'] as bool,
    earlyStopping: json['early_stopping'] as bool,
    numBeams: json['num_beams'] as int,
    temperature: json['temperature'] as int,
    topK: json['top_k'] as int,
    topP: json['top_p'] as int,
    repetitionPenalty: json['repetition_penalty'] as int,
    lengthPenalty: json['length_penalty'] as int,
    noRepeatNgramSize: json['no_repeat_ngram_size'] as int,
  );
}

Map<String, dynamic> _$SummaryParamsDtoToJson(SummaryParamsDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('relative_max_length', instance.relativeMaxLength);
  writeNotNull('relative_min_length', instance.relativeMinLength);
  writeNotNull('do_sample', instance.doSample);
  writeNotNull('early_stopping', instance.earlyStopping);
  writeNotNull('num_beams', instance.numBeams);
  writeNotNull('temperature', instance.temperature);
  writeNotNull('top_k', instance.topK);
  writeNotNull('top_p', instance.topP);
  writeNotNull('repetition_penalty', instance.repetitionPenalty);
  writeNotNull('length_penalty', instance.lengthPenalty);
  writeNotNull('no_repeat_ngram_size', instance.noRepeatNgramSize);
  return val;
}
