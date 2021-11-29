import 'package:domain/domain.dart';
import 'package:jizt_repository/src/mapper/mapper.dart';

class SummaryModelDtoToModelMapper extends Mapper<String, SummaryModel> {
  @override
  SummaryModel map(String input) {
    if (input == "t5") {
      return SummaryModel.t5;
    } else {
      throw MappingException();
    }
  }
}
