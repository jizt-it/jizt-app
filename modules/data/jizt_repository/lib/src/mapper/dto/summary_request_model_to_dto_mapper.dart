import 'package:domain/domain.dart';
import 'package:jizt_api/jizt_api.dart';
import 'package:jizt_repository/src/mapper/mapper.dart';

class SummaryRequestModelToDtoMapper
    extends Mapper<SummaryRequest, SummaryRequestDto> {
  @override
  SummaryRequestDto map(SummaryRequest input) {
    return SummaryRequestDto(
      source: input.source,
      model: SummaryModelModelToDtoMapper().map(input.model),
      params: SummaryParamsModelToDtoMapper().map(input.params),
    );
  }
}
