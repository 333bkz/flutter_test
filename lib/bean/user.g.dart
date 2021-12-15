// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..uid = json['uid'] as String?
  ..cellphone = json['cellphone'] as String?
  ..userName = json['userName'] as String?
  ..token = json['token'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'cellphone': instance.cellphone,
      'userName': instance.userName,
      'token': instance.token,
    };
