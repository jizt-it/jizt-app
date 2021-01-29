import '../../jizt_api.dart';
import 'json_parser.dart';

class SummaryJobParser extends JsonObjectParser<SummaryJob> {
  const SummaryJobParser();

  @override
  SummaryJob fromJson(Map<String, dynamic> decoded) =>
      SummaryJob.fromJson(decoded);
}
