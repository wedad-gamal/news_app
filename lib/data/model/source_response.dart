import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/data/model/source.dart' show SourceDto;

part 'source_response.g.dart';

@JsonSerializable()
class SourceResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "sources")
  final List<SourceDto>? sources;

  SourceResponse({this.status, this.sources});

  factory SourceResponse.fromJson(Map<String, dynamic> json) {
    return _$SourceResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SourceResponseToJson(this);
  }
}
