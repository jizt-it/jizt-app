import 'package:json_annotation/json_annotation.dart';

part 'summary_id_dto.g.dart';

@JsonSerializable(createToJson: false)
class SummaryIdDto {
  @JsonKey(name: 'summary_id')
  final String summaryId;

  SummaryIdDto({this.summaryId});

  factory SummaryIdDto.fromJson(Map<String, dynamic> json) =>
      _$SummaryIdDtoFromJson(json);
}
