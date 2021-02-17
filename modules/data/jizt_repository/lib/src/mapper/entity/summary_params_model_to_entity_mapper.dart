import 'package:domain/domain.dart';
import 'package:jizt_cache/jizt_cache.dart';
import 'package:jizt_repository/src/mapper/mapper.dart';

class SummaryParamsModelToEntityMapper
    extends Mapper<SummaryParams, SummaryParamsEntity> {
  @override
  SummaryParamsEntity map(SummaryParams input) {
    return SummaryParamsEntity(
      relativeMaxLength: input.relativeMaxLength,
      relativeMinLength: input.relativeMinLength,
      doSample: input.doSample,
      earlyStopping: input.earlyStopping,
      numBeams: input.numBeams,
      temperature: input.temperature,
      topK: input.topK,
      topP: input.topP,
      repetitionPenalty: input.repetitionPenalty,
      lengthPenalty: input.lengthPenalty,
      noRepeatNgramSize: input.noRepeatNgramSize,
    );
  }
}
