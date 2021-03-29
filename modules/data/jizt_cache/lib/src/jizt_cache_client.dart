import 'package:hive/hive.dart';
import 'package:jizt_cache/jizt_cache.dart';
import 'package:rxdart/rxdart.dart';

/// A local cache client for the Jizt app
abstract class JiztCacheClient {
  Future<void> add(String summaryId, SummaryEntity summaryEntity);

  SummaryEntity? get(String summaryId);

  Stream<SummaryEntity?> stream(String summaryId);

  List<SummaryEntity> getAll();

  Stream<List<SummaryEntity>> streamAll();

  Future<void> delete(String summaryId);

  Future<void> clear();
}

class JiztCacheClientImpl extends JiztCacheClient {
  JiztCacheClientImpl({
    required Box<SummaryEntity> box,
  }) : _box = box;

  final Box<SummaryEntity> _box;

  @override
  Future<void> add(String summaryId, SummaryEntity summaryEntity) async {
    await _box.put(summaryId, summaryEntity);
  }

  @override
  SummaryEntity? get(String summaryId) {
    return _box.get(summaryId);
  }

  @override
  Stream<SummaryEntity?> stream(String summaryId) {
    return _box
        .watch(key: summaryId)
        .map((_) => get(summaryId))
        .startWith(get(summaryId));
  }

  @override
  List<SummaryEntity> getAll() {
    return _box.toMap().values.toList(growable: false);
  }

  @override
  Stream<List<SummaryEntity>> streamAll() {
    return _box.watch().map((_) => getAll()).startWith(getAll());
  }

  @override
  Future<void> delete(String summaryId) {
    return _box.delete(summaryId);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }
}
