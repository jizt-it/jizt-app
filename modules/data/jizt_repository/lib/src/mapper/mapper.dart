export 'dto/summary_dto_to_model_mapper.dart';
export 'dto/summary_model_dto_to_model_mapper.dart';
export 'dto/summary_model_model_to_dto_mapper.dart';
export 'dto/summary_params_dto_to_model_mapper.dart';
export 'dto/summary_params_model_to_dto_mapper.dart';
export 'dto/summary_request_model_to_dto_mapper.dart';
export 'dto/summary_status_dto_to_model_mapper.dart';
export 'entity/summary_entity_to_model_mapper.dart';
export 'entity/summary_model_entity_to_model_mapper.dart';
export 'entity/summary_model_to_entity_mapper.dart';
export 'entity/summary_params_entity_to_model_mapper.dart';
export 'entity/summary_params_model_to_entity_mapper.dart';
export 'entity/summary_status_entity_to_model_mapper.dart';

abstract class Mapper<Input, Output> {
  Output map(Input input);
}

/// Exception thrown if a class cannot be mapped.
class MappingException implements Exception {
  String message = "";

  MappingException({this.message});

  @override
  String toString() => message;
}
