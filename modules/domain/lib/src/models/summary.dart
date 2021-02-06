class Summary {
  final DateTime startedAt;
  final DateTime endedAt;
  final Status status;
  final String output;

  Summary({this.startedAt, this.endedAt, this.status, this.output});
}

enum Status { preprocessing, completed, unknown }
