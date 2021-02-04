import 'dart:math';

import 'package:jizt_api/jizt_api.dart';

import '../jizt_repository.dart';

class JiztMockRepository extends JiztRepository {
  @override
  Future<double> requestSummary(String source) async {
    return Random().nextDouble();
  }

  int _count = 0;

  @override
  Future<Summary> getSummary(double jobId) async {
    _count++;
    return Future.delayed(Duration(seconds: 2), () {
      return Summary(
        DateTime.now(),
        DateTime.now(),
        _count == 3 ? 'completed' : 'pending',
        _count == 3 ? 'This is the summary of the job $jobId' : '',
      );
    });
  }
}
