// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthSettings _$AuthSettingsFromJson(Map<String, dynamic> json) =>
    _AuthSettings(
      useBiometric: json['useBiometric'] as bool,
      useLocalAuth: json['useLocalAuth'] as bool,
    );

Map<String, dynamic> _$AuthSettingsToJson(_AuthSettings instance) =>
    <String, dynamic>{
      'useBiometric': instance.useBiometric,
      'useLocalAuth': instance.useLocalAuth,
    };
