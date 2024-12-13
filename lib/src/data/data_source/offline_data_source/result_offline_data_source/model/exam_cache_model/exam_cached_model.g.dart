// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_cached_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExamCachedModelAdapter extends TypeAdapter<ExamCachedModel> {
  @override
  final int typeId = 1;

  @override
  ExamCachedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExamCachedModel(
      id: fields[0] as String?,
      title: fields[1] as String?,
      duration: fields[2] as num?,
      createdAt: fields[4] as String?,
      numberOfQuestions: fields[3] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, ExamCachedModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.numberOfQuestions)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamCachedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
