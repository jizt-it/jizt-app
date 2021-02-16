import 'package:domain/domain.dart';
import 'package:jizt_cache/jizt_cache.dart';
import 'package:jizt_repository/src/mapper/mapper.dart';

class SummaryModelToEntityMapper extends Mapper<Summary, SummaryEntity> {
  @override
  SummaryEntity map(Summary input) {
    return SummaryEntity(
      id: input.id,
      source: input.source,
      status: input.status.toString(),
      output: input.output,
      startedAt: input.startedAt,
      endedAt: input.endedAt,
    );
  }
}
