import 'package:domain/domain.dart';
import 'package:jizt_cache/jizt_cache.dart';
import 'package:jizt_repository/src/mapper/Mapper.dart';

class SummaryFromEntityMapper extends Mapper<SummaryEntity, Summary> {
  @override
  Summary map(SummaryEntity input) {
    return Summary(
        startedAt: input.startedAt,
        endedAt: input.endedAt,
        status: _fromString(input.status),
        output: input.output);
  }

  Status _fromString(String statusStr) {
    return Status.values.firstWhere((status) => status.toString() == statusStr,
        orElse: () => Status.unknown);
  }
}
