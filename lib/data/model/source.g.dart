// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SourceDtoAdapter extends TypeAdapter<SourceDto> {
  @override
  final typeId = 0;

  @override
  SourceDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SourceDto(
      id: fields[0] as String?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      url: fields[3] as String?,
      category: fields[4] as String?,
      language: fields[5] as String?,
      country: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SourceDto obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.language)
      ..writeByte(6)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SourceDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceDto _$SourceDtoFromJson(Map<String, dynamic> json) => SourceDto(
  id: json['id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  url: json['url'] as String?,
  category: json['category'] as String?,
  language: json['language'] as String?,
  country: json['country'] as String?,
);

Map<String, dynamic> _$SourceDtoToJson(SourceDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'url': instance.url,
  'category': instance.category,
  'language': instance.language,
  'country': instance.country,
};
