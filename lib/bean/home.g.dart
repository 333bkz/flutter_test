// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Classify _$ClassifyFromJson(Map<String, dynamic> json) => Classify(
      groupName: json['groupName'] as String,
      childList: (json['childList'] as List<dynamic>?)
          ?.map((e) => Classify.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClassifyToJson(Classify instance) => <String, dynamic>{
      'groupName': instance.groupName,
      'childList': instance.childList,
    };
