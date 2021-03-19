import 'package:domain/domain.dart';

class Summary extends Comparable<Summary> {
  final String id;
  final String source;
  final SummaryModel model;
  final SummaryParams params;
  final SummaryStatus status;
  final String output;
  final DateTime startedAt;
  final DateTime? endedAt;

  Summary({
    required this.id,
    required this.source,
    required this.model,
    required this.params,
    required this.status,
    required this.output,
    required this.startedAt,
    this.endedAt,
  });

  int get processingTime {
    return endedAt?.difference(startedAt).inSeconds ?? 0;
  }

  @override
  int compareTo(Summary other) {
    return startedAt.compareTo(other.startedAt);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Summary &&
          runtimeType == other.runtimeType &&
          startedAt == other.startedAt;

  @override
  int get hashCode => startedAt.hashCode;
}
