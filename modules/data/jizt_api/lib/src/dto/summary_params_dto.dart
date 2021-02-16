import 'package:json_annotation/json_annotation.dart';

part 'summary_params_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class SummaryParamsDto {
  @JsonKey(name: 'relative_max_length')
  final double relativeMaxLength;
  @JsonKey(name: 'relative_min_length')
  final double relativeMinLength;
  @JsonKey(name: 'do_sample')
  final bool doSample;
  @JsonKey(name: 'early_stopping')
  final bool earlyStopping;
  @JsonKey(name: 'num_beams')
  final int numBeams;
  final int temperature;
  @JsonKey(name: 'top_k')
  final int topK;
  @JsonKey(name: 'top_p')
  final int topP;
  @JsonKey(name: 'repetition_penalty')
  final int repetitionPenalty;
  @JsonKey(name: 'length_penalty')
  final int lengthPenalty;
  @JsonKey(name: 'no_repeat_ngram_size')
  final int noRepeatNgramSize;

  SummaryParamsDto({
    this.relativeMaxLength,
    this.relativeMinLength,
    this.doSample,
    this.earlyStopping,
    this.numBeams,
    this.temperature,
    this.topK,
    this.topP,
    this.repetitionPenalty,
    this.lengthPenalty,
    this.noRepeatNgramSize,
  });

  factory SummaryParamsDto.fromJson(Map<String, dynamic> json) =>
      _$SummaryParamsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryParamsDtoToJson(this);
}
