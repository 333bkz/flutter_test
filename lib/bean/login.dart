import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

/// [part 'login.g.dart'] 必须和当前文件名一致
/// fromJson ，toJson 按规则手动添加
/// 运行命令: flutter pub run build_runner build
@JsonSerializable()
class User {
  String? uid;
  String? cellphone;
  String? userName;
  String? token;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return "uid:$uid, userName:$userName, cellphone:$cellphone, token:$token";
  }
}
