import 'package:jizt_api/jizt_api.dart';

import 'json_parser.dart';

class SummaryParser extends JsonObjectParser<SummaryDto> {
  const SummaryParser();

  @override
  SummaryDto fromJson(Map<String, dynamic> decoded) =>
      SummaryDto.fromJson(decoded);
}
