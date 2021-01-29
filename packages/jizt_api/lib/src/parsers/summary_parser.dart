import '../../jizt_api.dart';
import 'json_parser.dart';

class SummaryParser extends JsonObjectParser<Summary> {
  const SummaryParser();

  @override
  Summary fromJson(Map<String, dynamic> decoded) => Summary.fromJson(decoded);
}
