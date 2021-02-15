import 'package:domain/domain.dart';
import 'package:jizt_api/jizt_api.dart';
import 'package:jizt_cache/jizt_cache.dart';
import 'package:jizt_repository/src/mapper/dto/SummaryDtoToModelMapper.dart';
import 'package:jizt_repository/src/mapper/entity/SummaryEntityToModelMapper.dart';
import 'package:jizt_repository/src/mapper/entity/SummaryModelToEntityMapper.dart';

abstract class JiztRepository {
  Future<String> requestSummary(String source);

  Future<Summary> getSummary(String id);

  Future<List<Summary>> getAllSummaries();

  Stream<List<Summary>> streamAllSummaries();

  Future<void> deleteSummary(String id);
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
    final response = await _jiztApiClient.requestSummary(
      SummaryRequestDto(source: source),
    );
    // Cache summary
    _jiztCacheClient.add(
      response.summaryId,
      SummaryEntity(id: response.summaryId, source: source),
    );
    return response.summaryId;
  }

  @override
  Future<Summary> getSummary(String id) async {
    final summaryEntity = _jiztCacheClient.get(id);
    if (summaryEntity == null) throw Exception('Unknown summary id');
    // Return cached data if summary is completed
    final cachedSummary = SummaryEntityToModelMapper().map(summaryEntity);
    if (cachedSummary.status == Status.completed) {
      print('getSummary(): cache hit');
      return cachedSummary;
    }
    // Otherwise, fetch from backend
    final summaryDto = await _jiztApiClient.getSummary(id);
    final summary = SummaryDtoToModelMapper().map(SummaryDtoWrapper(
      id: id,
      source: cachedSummary.source,
      summaryDto: summaryDto,
    ));
    // Update cache if completed
    if (summary.status == Status.completed) {
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
