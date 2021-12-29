import 'package:domain/domain.dart';
import 'package:jizt_repository/src/mapper/mapper.dart';

class SummaryStatusDtoToModelMapper extends Mapper<String, SummaryStatus> {
  @override
  SummaryStatus map(String input) {
    return SummaryStatus.values.byName(input);
  }
}
