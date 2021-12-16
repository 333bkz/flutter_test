import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class ApiResponse {
  String data;

  int? code;

  String? text;

  ApiResponse({required this.data, this.code, this.text});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

  bool get isSuccess {
    return code == 200;
  }
}
