import 'package:hive/hive.dart';
import 'package:jizt_cache/jizt_cache.dart';

part 'summary_entity.g.dart';

@HiveType(typeId: 0)
class SummaryEntity extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String source;
  @HiveField(2)
  final String model;
  @HiveField(3)
  final SummaryParamsEntity params;
  @HiveField(4)
  final String status;
  @HiveField(5)
  final String output;
  @HiveField(6)
  final DateTime startedAt;
  @HiveField(7)
  final DateTime endedAt;

  SummaryEntity({
    this.id,
    this.source,
    this.model,
    this.params,
    this.status,
    this.output,
    this.startedAt,
    this.endedAt,
  });
}
