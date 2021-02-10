import 'dart:math';

import 'package:jizt_api/jizt_api.dart';

/// A Dart Mock API Client for the Jizt REST API.
class JiztMockApiClient extends JiztApiClient {
  @override
  Future<SummaryIdDto> requestSummary(SummaryRequestDto request) async {
    return SummaryIdDto(summaryId: Random().nextDouble().toString());
  }

  int _count = 0;

  @override
  Future<SummaryDto> getSummary(String id) async {
    _count++;
    return Future.delayed(Duration(seconds: 2), () {
      return SummaryDto(
        DateTime.now(),
        DateTime.now(),
        _count == 3 ? 'completed' : 'pending',
        _count == 3 ? 'This is the summary with id = $id' : '',
      );
    });
  }
}
