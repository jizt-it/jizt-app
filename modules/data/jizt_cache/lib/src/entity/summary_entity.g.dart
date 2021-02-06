// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SummaryEntityAdapter extends TypeAdapter<SummaryEntity> {
  @override
  final int typeId = 0;

  @override
  SummaryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SummaryEntity(
      startedAt: fields[0] as DateTime,
      endedAt: fields[1] as DateTime,
      status: fields[2] as String,
      output: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SummaryEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.startedAt)
      ..writeByte(1)
      ..write(obj.endedAt)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.output);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SummaryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
