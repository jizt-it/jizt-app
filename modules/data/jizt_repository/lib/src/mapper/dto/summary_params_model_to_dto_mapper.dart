import 'package:domain/domain.dart';
import 'package:jizt_api/jizt_api.dart';
import 'package:jizt_repository/src/mapper/mapper.dart';

class SummaryParamsModelToDtoMapper
    extends Mapper<SummaryParams, SummaryParamsDto> {
  @override
  SummaryParamsDto map(SummaryParams input) {
    return SummaryParamsDto(
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
        noRepeatNgramSize: input.noRepeatNgramSize);
  }
}
