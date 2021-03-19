import 'package:domain/domain.dart';

class SummaryRequest {
  final String source;
  final SummaryModel model;
  final SummaryParams params;

  SummaryRequest({
    required this.source,
    required this.model,
    required this.params,
  });
}
