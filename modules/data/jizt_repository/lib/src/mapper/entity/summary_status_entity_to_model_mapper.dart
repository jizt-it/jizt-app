import 'package:domain/domain.dart';
import 'package:jizt_repository/src/mapper/Mapper.dart';

class SummaryStatusEntityToModelMapper extends Mapper<String, SummaryStatus> {
  @override
  SummaryStatus map(String input) {
    return SummaryStatus.values.firstWhere(
        (status) => status.toString() == input,
        orElse: () => SummaryStatus.unknown);
  }
}
