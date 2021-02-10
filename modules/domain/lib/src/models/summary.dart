class Summary {
  final String id;
  final String source;
  final Status status;
  final String output;
  final DateTime startedAt;
  final DateTime endedAt;

  Summary(
      {this.id,
      this.source,
      this.status,
      this.output,
      this.startedAt,
      this.endedAt});
}

enum Status { preprocessing, completed, unknown }
