import 'package:domain/domain.dart';

class Summary extends Comparable<Summary> {
  final String id;
  final String source;
  final SummaryStatus status;
  final String output;
  final DateTime startedAt;
  final DateTime endedAt;

  // TODO add model and params

  Summary({
    this.id,
    this.source,
    this.status,
    this.output,
    this.startedAt,
    this.endedAt,
  });

  @override
  int compareTo(Summary other) {
    if (startedAt == null && other.startedAt == null) {
      return 0;
    } else if (startedAt == null && other.startedAt != null) {
      return -1;
    } else if (startedAt != null && other.startedAt == null) {
      return 1;
    } else {
      return startedAt.compareTo(other.startedAt);
    }
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
