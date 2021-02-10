import 'dart:io';

import 'package:jizt_api/jizt_api.dart';

// Run: `dart run example/main.dart`
void main() async {
  final jiztApi = JiztApiClientImpl();

  try {
    final id = await jiztApi.requestSummary(
      SummaryRequestDto(source: 'Hello World!'),
    );
    print("Summary id: ${id.summaryId}");
    final summary = await jiztApi.getSummary(id.summaryId);
    print("Summary: ${summary.output}");
  } on Exception catch (e) {
    print('Error: $e');
  }

  exit(0);
}
