import 'package:jizt_api/jizt_api.dart';

import 'json_parser.dart';

class SummaryJobParser extends JsonObjectParser<SummaryJobDto> {
  const SummaryJobParser();

  @override
  SummaryJobDto fromJson(Map<String, dynamic> decoded) =>
      SummaryJobDto.fromJson(decoded);
}
