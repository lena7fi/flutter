// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginToken.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginToken _$LoginTokenFromJson(Map<String, dynamic> json) {
  return LoginToken(
    json['username'] as String,
    json['token'] as String,
  )..created = json['created'] as String;
}

Map<String, dynamic> _$LoginTokenToJson(LoginToken instance) =>
    <String, dynamic>{
      'created': instance.created,
      'username': instance.username,
      'token': instance.token,
    };
