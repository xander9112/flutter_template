// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthenticatedUser _$AuthenticatedUserFromJson(Map<String, dynamic> json) =>
    _AuthenticatedUser(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      login: json['login'] as String,
      lastName: json['last_name'] as String,
      firstName: json['first_name'] as String,
      patronymic: json['patronymic'] as String?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$AuthenticatedUserToJson(_AuthenticatedUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'login': instance.login,
      'last_name': instance.lastName,
      'first_name': instance.firstName,
      'patronymic': instance.patronymic,
      'birthday': instance.birthday?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
