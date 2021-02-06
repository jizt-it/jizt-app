import 'package:domain/domain.dart';
import 'package:jizt_cache/jizt_cache.dart';
import 'package:jizt_repository/src/mapper/Mapper.dart';

class SummaryToEntityMapper extends Mapper<Summary, SummaryEntity> {
  @override
  SummaryEntity map(Summary input) {
    return SummaryEntity(
        startedAt: input.startedAt,
        endedAt: input.endedAt,
        status: input.status.toString(),
        output: input.output);
  }
}
