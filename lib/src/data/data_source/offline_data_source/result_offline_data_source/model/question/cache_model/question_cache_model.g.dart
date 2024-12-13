// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_cache_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionCacheModelAdapter extends TypeAdapter<QuestionCacheModel> {
  @override
  final int typeId = 2;

  @override
  QuestionCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionCacheModel(
      examId: fields[2] as String?,
      answer: (fields[1] as List?)?.cast<AnswerCachedModel>(),
      duration: fields[3] as num?,
      title: fields[4] as String?,
      questionId: fields[6] as String?,
      numberOfQuestions: fields[5] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, QuestionCacheModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.answer)
      ..writeByte(2)
      ..write(obj.examId)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.numberOfQuestions)
      ..writeByte(6)
      ..write(obj.questionId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AnswerCachedModelAdapter extends TypeAdapter<AnswerCachedModel> {
  @override
  final int typeId = 3;

  @override
  AnswerCachedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnswerCachedModel(
      key: fields[2] as String?,
      answer: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AnswerCachedModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.answer)
      ..writeByte(2)
      ..write(obj.key);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswerCachedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
