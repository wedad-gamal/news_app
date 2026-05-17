import 'package:json_annotation/json_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

part 'source.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class SourceDto {
  @JsonKey(name: "id")
  @HiveField(0)
  final String? id;

  @JsonKey(name: "name")
  @HiveField(1)
  final String? name;

  @JsonKey(name: "description")
  @HiveField(2)
  final String? description;

  @JsonKey(name: "url")
  @HiveField(3)
  final String? url;

  @JsonKey(name: "category")
  @HiveField(4)
  final String? category;

  @JsonKey(name: "language")
  @HiveField(5)
  final String? language;

  @JsonKey(name: "country")
  @HiveField(6)
  final String? country;

  SourceDto({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory SourceDto.fromJson(Map<String, dynamic> json) {
    return _$SourceDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SourceDtoToJson(this);
  }
}
