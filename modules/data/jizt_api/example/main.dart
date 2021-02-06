import 'dart:io';

import 'package:jizt_api/jizt_api.dart';

// Run: `dart run example/main.dart`
void main() async {
  final jiztApi = JiztApiClientImpl();

  try {
    final job = await jiztApi.requestSummary(
      SummaryRequestDto(source: 'Hello World!'),
    );
    print("Job id: ${job.jobId}");
    final summary = await jiztApi.getSummary(job.jobId);
    print("Summary: ${summary.output}");
  } on Exception catch (e) {
    print('Error: $e');
  }

  exit(0);
}
