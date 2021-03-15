// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Anime.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeAdapter extends TypeAdapter<Anime> {
  @override
  final int typeId = 101;

  @override
  Anime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Anime(
      id: fields[0] as int,
      imgUrl: fields[1] as String,
      source: fields[4] as String,
      status: fields[7] as String,
      synopsis: fields[8] as String,
      title: fields[2] as String,
      airing: fields[5] as String,
      titleJapanese: fields[3] as String,
      type: fields[6] as String,
      genres: (fields[10] as List)?.cast<String>(),
      score: fields[9] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Anime obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imgUrl)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.titleJapanese)
      ..writeByte(4)
      ..write(obj.source)
      ..writeByte(5)
      ..write(obj.airing)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.synopsis)
      ..writeByte(9)
      ..write(obj.score)
      ..writeByte(10)
      ..write(obj.genres);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
