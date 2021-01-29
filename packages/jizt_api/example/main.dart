import 'dart:io';

import '../lib/jizt_api.dart';

// dart run example/main.dart
void main() async {
  final jiztApi = JiztApiClient();

  try {
    final job = await jiztApi.requestSummary(SummaryRequest('Hello World!'));
    print("Job id: ${job.jobId}");
    final summary = await jiztApi.getSummary(job.jobId);
    print("Summary: ${summary.output}");
  } on Exception catch (e) {
    print('Error: $e');
  }

  exit(0);
}
