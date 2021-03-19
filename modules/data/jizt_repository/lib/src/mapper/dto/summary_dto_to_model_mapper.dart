import 'package:domain/domain.dart';
import 'package:jizt_api/jizt_api.dart';
import 'package:jizt_repository/src/mapper/mapper.dart';

class SummaryDtoToModelMapper extends Mapper<SummaryDtoWrapper, Summary> {
  @override
  Summary map(SummaryDtoWrapper input) {
    return Summary(
      id: input.summaryDto.summaryId ?? "",
      source: input.source,
      model: input.summaryDto.model != null
          ? SummaryModelDtoToModelMapper().map(input.summaryDto.model!)
          : SummaryModel.unknown,
      params: input.summaryDto.params != null
          ? SummaryParamsDtoToModelMapper().map(input.summaryDto.params!)
          : SummaryParams(),
      status: input.summaryDto.status != null
          ? SummaryStatusDtoToModelMapper().map(input.summaryDto.status!)
          : SummaryStatus.unknown,
      output: input.summaryDto.output ?? "",
      startedAt: input.summaryDto.startedAt ?? DateTime.now(),
      endedAt: input.summaryDto.endedAt,
    );
  }
}

class SummaryDtoWrapper {
  final String source;
  final SummaryDto summaryDto;

  SummaryDtoWrapper({
    required this.source,
    required this.summaryDto,
  });
}
