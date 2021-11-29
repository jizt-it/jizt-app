import 'package:domain/domain.dart';
import 'package:jizt_repository/src/mapper/mapper.dart';

class SummaryModelModelToDtoMapper extends Mapper<SummaryModel, String> {
  @override
  String map(SummaryModel input) {
    if (input == SummaryModel.t5) {
      return "t5";
    } else {
      throw MappingException();
    }
  }
}
