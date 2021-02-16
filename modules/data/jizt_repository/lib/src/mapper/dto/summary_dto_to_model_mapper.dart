import 'package:domain/domain.dart';
import 'package:jizt_api/jizt_api.dart';
import 'package:jizt_repository/src/mapper/mapper.dart';

class SummaryDtoToModelMapper extends Mapper<SummaryDtoWrapper, Summary> {
  @override
  Summary map(SummaryDtoWrapper input) {
    return Summary(
      id: input.summaryDto.summaryId,
      source: input.source,
      status: SummaryStatusDtoToModelMapper().map(input.summaryDto.status),
      output: input.summaryDto.output,
      startedAt: input.summaryDto.startedAt,
      endedAt: input.summaryDto.endedAt,
    );
  }
}

class SummaryDtoWrapper {
  final String source;
  final SummaryDto summaryDto;

  SummaryDtoWrapper({this.source, this.summaryDto});
}
