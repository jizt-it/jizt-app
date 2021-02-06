import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jizt_cache/jizt_cache.dart';

class JiztHiveBoxProvider {
  static Future<Box<SummaryEntity>> getSummariesBox() async {
    await Hive.initFlutter();
    Hive.registerAdapter<SummaryEntity>(SummaryEntityAdapter());
    return Hive.openBox<SummaryEntity>('Summaries');
  }
}
