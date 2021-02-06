import 'package:hive/hive.dart';
import 'package:jizt_cache/jizt_cache.dart';

/// A local cache client for the Jizt app
abstract class JiztCacheClient {
  Future<void> add(String summaryId, SummaryEntity summaryEntity);

  SummaryEntity get(String summaryId);

  Map<String, SummaryEntity> getAll();

  Future<void> clear();
}

class JiztCacheClientImpl extends JiztCacheClient {
  JiztCacheClientImpl({Box<SummaryEntity> box}) : _box = box;

  final Box<SummaryEntity> _box;

  @override
  Future<void> add(String summaryId, SummaryEntity summaryEntity) async {
    if (_boxIsClosed) return;
    await _box.put(summaryId, summaryEntity);
  }

  @override
  SummaryEntity get(String summaryId) {
    if (_boxIsClosed) return null;
    return _box.get(summaryId);
  }

  @override
  Map<String, SummaryEntity> getAll() {
    if (_boxIsClosed) return null;
    return _box.toMap();
  }

  @override
  Future<void> clear() async {
    if (_boxIsClosed) return;
    await _box.clear();
  }

  bool get _boxIsClosed => !(this._box?.isOpen ?? false);
}
