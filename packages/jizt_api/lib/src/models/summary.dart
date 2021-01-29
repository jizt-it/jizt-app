import 'package:json_annotation/json_annotation.dart';

part 'summary.g.dart';

@JsonSerializable(createToJson: false)
class Summary {
  final DateTime startedAt;
  final DateTime endedAt;
  final String state;
  final String output;

  Summary(this.startedAt, this.endedAt, this.state, this.output);

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
}
