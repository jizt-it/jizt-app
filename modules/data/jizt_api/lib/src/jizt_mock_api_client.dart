import 'dart:math';

import 'package:jizt_api/jizt_api.dart';

/// A Dart Mock API Client for the Jizt REST API.
class JiztMockApiClient extends JiztApiClient {
  @override
  Future<SummaryDto> requestSummary(SummaryRequestDto request) async {
    return SummaryDto(
      summaryId: Random().nextDouble().toString(),
      startedAt: DateTime.now(),
      status: "summarizing",
      model: "t5",
    );
  }

  int _count = 0;

  @override
  Future<SummaryDto> getSummary(String id) async {
    _count++;
    return Future.delayed(Duration(seconds: 2), () {
      return SummaryDto(
          summaryId: Random().nextDouble().toString(),
          startedAt: DateTime.now().subtract(Duration(seconds: 10)),
          endedAt: DateTime.now(),
          status: _count == 3 ? 'completed' : 'pending',
          output: _count == 3 ? 'This is the summary with id = $id' : '',
          model: "t5",
          params: SummaryParamsDto(
            relativeMaxLength: 0.4,
            relativeMinLength: 0.1,
            numBeams: 4,
            noRepeatNgramSize: 4,
          ));
    });
  }
}
