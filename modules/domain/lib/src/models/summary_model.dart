enum SummaryModel {
  t5,
  unknown,
}

extension SummaryModelExtension on SummaryModel {
  String get displayName {
    switch (this) {
      case SummaryModel.t5:
        return 'Google T5';
      default:
        return 'Unknown';
    }
  }
}
