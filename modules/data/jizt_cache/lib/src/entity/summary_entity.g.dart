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
      id: fields[0] as String,
      source: fields[1] as String,
      status: fields[2] as String,
      output: fields[3] as String,
      startedAt: fields[4] as DateTime,
      endedAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SummaryEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.source)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.output)
      ..writeByte(4)
      ..write(obj.startedAt)
      ..writeByte(5)
      ..write(obj.endedAt);
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
