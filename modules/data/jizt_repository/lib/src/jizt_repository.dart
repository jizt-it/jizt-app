import 'package:domain/domain.dart';
import 'package:jizt_api/jizt_api.dart';
import 'package:jizt_cache/jizt_cache.dart';
import 'package:jizt_repository/src/mapper/dto/SummaryFromDtoMapper.dart';
import 'package:jizt_repository/src/mapper/entity/SummaryFromEntityMapper.dart';
import 'package:jizt_repository/src/mapper/entity/SummaryToEntityMapper.dart';

abstract class JiztRepository {
  Future<String> requestSummary(String source);

  Future<Summary> getSummary(String id);

  Future<Map<String, Summary>> getAllSummaries();
}

class JiztRepositoryImpl extends JiztRepository {
  final JiztApiClient _jiztApiClient;
  final JiztCacheClient _jiztCacheClient;

  JiztRepositoryImpl({
    JiztApiClient jiztApiClient,
    JiztCacheClient jiztCacheClient,
  })  : _jiztApiClient = jiztApiClient ?? JiztApiClientImpl(),
        _jiztCacheClient = jiztCacheClient;

  @override
  Future<String> requestSummary(String source) async {
    final job = await _jiztApiClient.requestSummary(
      SummaryRequestDto(source: source),
    );
    return job.jobId;
  }

  @override
  Future<Summary> getSummary(String id) async {
    // Return cached data if exists
    final cachedSummary = _jiztCacheClient.get(id);
    if (cachedSummary != null) {
      print('getSummary(): cache hit');
      return SummaryFromEntityMapper().map(cachedSummary);
    }
    // Otherwise, fetch from backend
    final remoteSummary = await _jiztApiClient.getSummary(id);
    final summary = SummaryFromDtoMapper().map(remoteSummary);
    if (summary.status == Status.completed) {
      await _jiztCacheClient.add(id, SummaryToEntityMapper().map(summary));
    }
    return summary;
  }

  @override
  Future<Map<String, Summary>> getAllSummaries() async {
    final mapper = SummaryFromEntityMapper();
    return _jiztCacheClient
        .getAll()
        .map((key, value) => MapEntry(key, mapper.map(value)));
  }
}
