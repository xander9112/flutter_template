// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokensDTO _$TokensDTOFromJson(Map<String, dynamic> json) => _TokensDTO(
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
);

Map<String, dynamic> _$TokensDTOToJson(_TokensDTO instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
