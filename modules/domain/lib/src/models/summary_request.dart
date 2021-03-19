import 'package:domain/domain.dart';

class SummaryRequest {
  final String source;
  final SummaryModel model;
  final SummaryParams params;

  SummaryRequest(this.source, this.model, this.params);
}
