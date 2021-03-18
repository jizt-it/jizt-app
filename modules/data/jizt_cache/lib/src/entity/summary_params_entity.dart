import 'package:hive/hive.dart';

part 'summary_params_entity.g.dart';

@HiveType(typeId: 1)
class SummaryParamsEntity extends HiveObject {
  @HiveField(0)
  final double? relativeMaxLength;
  @HiveField(1)
  final double? relativeMinLength;
  @HiveField(2)
  final bool? doSample;
  @HiveField(3)
  final bool? earlyStopping;
  @HiveField(4)
  final int? numBeams;
  @HiveField(5)
  final int? temperature;
  @HiveField(6)
  final int? topK;
  @HiveField(7)
  final int? topP;
  @HiveField(8)
  final int? repetitionPenalty;
  @HiveField(9)
  final int? lengthPenalty;
  @HiveField(10)
  final int? noRepeatNgramSize;

  SummaryParamsEntity({
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
}
