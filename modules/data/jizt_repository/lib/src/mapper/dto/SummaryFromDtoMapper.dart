import 'package:domain/domain.dart';
import 'package:jizt_api/jizt_api.dart';
import 'package:jizt_repository/src/mapper/Mapper.dart';

class SummaryFromDtoMapper extends Mapper<SummaryDto, Summary> {
  @override
  Summary map(SummaryDto input) {
    return Summary(
        startedAt: input.startedAt,
        endedAt: input.endedAt,
        status: _fromString(input.status),
        output: input.output);
  }

  Status _fromString(String statusStr) {
    return Status.values.firstWhere(
        (status) => status.toString() == 'Status.' + statusStr,
        orElse: () => Status.unknown);
  }
}
