import 'package:json_annotation/json_annotation.dart';

part 'bean.g.dart';

@JsonSerializable()
class ApiResponse<T> {

  @JsonKey(name: 'data')
  String? _data;

  int code = 200;

  String? text;

  ApiResponse();

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
