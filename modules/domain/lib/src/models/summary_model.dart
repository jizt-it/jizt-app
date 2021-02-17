enum SummaryModel {
  t5Large,
  unknown,
}

extension SummaryModelExtension on SummaryModel {
  String get displayName {
    switch (this) {
      case SummaryModel.t5Large:
        return 'Google T5 large';
      default:
        return 'Unknown';
    }
  }
}
