import 'package:hive/hive.dart';

part 'summary_entity.g.dart';

@HiveType(typeId: 0)
class SummaryEntity extends HiveObject {
  @HiveField(0)
  final DateTime startedAt;
  @HiveField(1)
  final DateTime endedAt;
  @HiveField(2)
  final String status;
  @HiveField(3)
  final String output;

  SummaryEntity({this.startedAt, this.endedAt, this.status, this.output});
}
