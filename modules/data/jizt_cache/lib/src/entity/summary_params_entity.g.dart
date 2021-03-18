// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_params_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SummaryParamsEntityAdapter extends TypeAdapter<SummaryParamsEntity> {
  @override
  final int typeId = 1;

  @override
  SummaryParamsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SummaryParamsEntity(
      relativeMaxLength: fields[0] as double?,
      relativeMinLength: fields[1] as double?,
      doSample: fields[2] as bool?,
      earlyStopping: fields[3] as bool?,
      numBeams: fields[4] as int?,
      temperature: fields[5] as int?,
      topK: fields[6] as int?,
      topP: fields[7] as int?,
      repetitionPenalty: fields[8] as int?,
      lengthPenalty: fields[9] as int?,
      noRepeatNgramSize: fields[10] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SummaryParamsEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.relativeMaxLength)
      ..writeByte(1)
      ..write(obj.relativeMinLength)
      ..writeByte(2)
      ..write(obj.doSample)
      ..writeByte(3)
      ..write(obj.earlyStopping)
      ..writeByte(4)
      ..write(obj.numBeams)
      ..writeByte(5)
      ..write(obj.temperature)
      ..writeByte(6)
      ..write(obj.topK)
      ..writeByte(7)
      ..write(obj.topP)
      ..writeByte(8)
      ..write(obj.repetitionPenalty)
      ..writeByte(9)
      ..write(obj.lengthPenalty)
      ..writeByte(10)
      ..write(obj.noRepeatNgramSize);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SummaryParamsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
