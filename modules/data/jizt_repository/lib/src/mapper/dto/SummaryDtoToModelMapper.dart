import 'package:domain/domain.dart';
import 'package:jizt_api/jizt_api.dart';
import 'package:jizt_repository/src/mapper/Mapper.dart';

class SummaryDtoToModelMapper extends Mapper<SummaryDtoWrapper, Summary> {
  @override
  Summary map(SummaryDtoWrapper input) {
    return Summary(
      id: input.id,
      source: input.source,
      status: _fromString(input.summaryDto.status),
      output: input.summaryDto.output,
      startedAt: input.summaryDto.startedAt,
      endedAt: input.summaryDto.endedAt,
    );
  }

  Status _fromString(String statusStr) {
    return Status.values.firstWhere(
        (status) => status.toString() == 'Status.' + statusStr,
        orElse: () => Status.unknown);
  }
}

class SummaryDtoWrapper {
  final String id;
  final String source;
  final SummaryDto summaryDto;

  SummaryDtoWrapper({this.id, this.source, this.summaryDto});
}
