import 'package:jizt_api/jizt_api.dart';

abstract class JiztRepository {
  Future<double> requestSummary(String source);

  Future<Summary> getSummary(double jobId);
}

class JiztRepositoryImpl extends JiztRepository {
  final JiztApiClient _jiztApiClient;

  JiztRepositoryImpl({JiztApiClient jiztApiClient})
      : _jiztApiClient = jiztApiClient ?? JiztApiClient();

  @override
  Future<double> requestSummary(String source) async {
    final job = await _jiztApiClient.requestSummary(SummaryRequest(source));
    return job.jobId;
  }

  @override
  Future<Summary> getSummary(double jobId) async {
    return await _jiztApiClient.getSummary(jobId);
  }
}
