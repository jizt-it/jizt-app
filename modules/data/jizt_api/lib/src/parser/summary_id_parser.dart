import 'package:jizt_api/jizt_api.dart';

import 'json_parser.dart';

class SummaryIdParser extends JsonObjectParser<SummaryIdDto> {
  const SummaryIdParser();

  @override
  SummaryIdDto fromJson(Map<String, dynamic> decoded) =>
      SummaryIdDto.fromJson(decoded);
}
