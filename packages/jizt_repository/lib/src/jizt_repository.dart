import 'package:jizt_api/jizt_api.dart';

class JiztRepository {
  final JiztApiClient _jiztApiClient;

  JiztRepository({JiztApiClient jiztApiClient})
      : _jiztApiClient = jiztApiClient ?? JiztApiClient();

  Future<double> requestSummary(String source) async {
    final job = await _jiztApiClient.requestSummary(SummaryRequest(source));
    return job.jobId;
  }

  Future<Summary> getSummary(double jobId) async {
    return await _jiztApiClient.getSummary(jobId);
  }
}
