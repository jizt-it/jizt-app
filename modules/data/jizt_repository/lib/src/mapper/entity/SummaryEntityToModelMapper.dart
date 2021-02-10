import 'package:domain/domain.dart';
import 'package:jizt_cache/jizt_cache.dart';
import 'package:jizt_repository/src/mapper/Mapper.dart';

class SummaryEntityToModelMapper extends Mapper<SummaryEntity, Summary> {
  @override
  Summary map(SummaryEntity input) {
    return Summary(
      id: input.id,
      source: input.source,
      status: _fromString(input.status),
      output: input.output,
      startedAt: input.startedAt,
      endedAt: input.endedAt,
    );
  }

  Status _fromString(String statusStr) {
    return Status.values.firstWhere((status) => status.toString() == statusStr,
        orElse: () => Status.unknown);
  }
}
