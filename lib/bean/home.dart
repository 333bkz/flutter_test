import 'package:json_annotation/json_annotation.dart';

part 'home.g.dart';

@JsonSerializable()
class Classify {
  String groupName;
  List<Classify>? childList;

  Classify({required this.groupName, this.childList});

  factory Classify.fromJson(Map<String, dynamic> json) =>
      _$ClassifyFromJson(json);

  Map<String, dynamic> toJson() => _$ClassifyToJson(this);

  @override
  String toString() {
    return "groupName:$groupName, childList:${childList?.length}";
  }
}
