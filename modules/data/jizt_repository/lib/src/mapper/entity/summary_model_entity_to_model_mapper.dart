import 'package:domain/domain.dart';
import 'package:jizt_repository/src/mapper/mapper.dart';

class SummaryModelEntityToModelMapper extends Mapper<String, SummaryModel> {
  @override
  SummaryModel map(String input) {
    return SummaryModel.values.firstWhere(
        (status) => status.toString() == input,
        orElse: () => SummaryModel.unknown);
  }
}
