import 'package:domain/domain.dart';
import 'package:jizt_api/jizt_api.dart';
import 'package:jizt_cache/jizt_cache.dart';
import 'package:jizt_repository/src/mapper/mapper.dart';

class JiztRepositoryImpl extends JiztRepository {
  final JiztApiClient _jiztApiClient;
  final JiztCacheClient _jiztCacheClient;

  JiztRepositoryImpl({
    JiztApiClient jiztApiClient,
    JiztCacheClient jiztCacheClient,
  })  : _jiztApiClient = jiztApiClient ?? JiztApiClientImpl(),
        _jiztCacheClient = jiztCacheClient;

  @override
  Future<Summary> requestSummary(SummaryRequest request) async {
    final summaryDto = await _jiztApiClient.requestSummary(
      SummaryRequestModelToDtoMapper().map(request),
    );
    // Cache summary source
    _jiztCacheClient.add(
      summaryDto.summaryId,
      SummaryEntity(id: summaryDto.summaryId, source: request.source),
    );
    return SummaryDtoToModelMapper().map(SummaryDtoWrapper(
      source: request.source,
      summaryDto: summaryDto,
    ));
  }

  @override
  Future<Summary> getSummary(String id) async {
    final summaryEntity = _jiztCacheClient.get(id);
    if (summaryEntity == null) throw Exception('Unknown summary id');
    // Return cached data if summary is completed
    final cachedSummary = SummaryEntityToModelMapper().map(summaryEntity);
    if (cachedSummary.status == SummaryStatus.completed) {
      print('getSummary(): cache hit');
      return cachedSummary;
    }
    // Otherwise, fetch from backend
    final summaryDto = await _jiztApiClient.getSummary(id);
    final summary = SummaryDtoToModelMapper().map(SummaryDtoWrapper(
      source: cachedSummary.source,
      summaryDto: summaryDto,
    ));
    // Update cache if completed
    if (summary.status == SummaryStatus.completed) {
      _jiztCacheClient.add(id, SummaryModelToEntityMapper().map(summary));
    }
    return summary;
  }

  @override
  Future<List<Summary>> getAllSummaries() async {
    final mapper = SummaryEntityToModelMapper();
    return _jiztCacheClient
        .getAll()
        .map((summaryEntity) => mapper.map(summaryEntity));
  }

  @override
  Stream<List<Summary>> streamAllSummaries() {
    final mapper = SummaryEntityToModelMapper();
    return _jiztCacheClient.streamAll().map((summaryEntities) => summaryEntities
        .map(
          (summaryEntity) => mapper.map(summaryEntity),
        )
        .toList(growable: false));
  }

  @override
  Future<void> deleteSummary(String id) {
    return _jiztCacheClient.delete(id);
  }
}
