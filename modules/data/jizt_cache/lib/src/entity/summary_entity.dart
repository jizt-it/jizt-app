import 'package:hive/hive.dart';

part 'summary_entity.g.dart';

@HiveType(typeId: 0)
class SummaryEntity extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String source;
  @HiveField(2)
  final String status;
  @HiveField(3)
  final String output;
  @HiveField(4)
  final DateTime startedAt;
  @HiveField(5)
  final DateTime endedAt;

  SummaryEntity({
    this.id,
    this.source,
    this.status,
    this.output,
    this.startedAt,
    this.endedAt,
  });
}
