// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthSettings implements DiagnosticableTreeMixin {

 bool get useBiometric; bool get useLocalAuth;
/// Create a copy of AuthSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSettingsCopyWith<AuthSettings> get copyWith => _$AuthSettingsCopyWithImpl<AuthSettings>(this as AuthSettings, _$identity);

  /// Serializes this AuthSettings to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthSettings'))
    ..add(DiagnosticsProperty('useBiometric', useBiometric))..add(DiagnosticsProperty('useLocalAuth', useLocalAuth));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSettings&&(identical(other.useBiometric, useBiometric) || other.useBiometric == useBiometric)&&(identical(other.useLocalAuth, useLocalAuth) || other.useLocalAuth == useLocalAuth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,useBiometric,useLocalAuth);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthSettings(useBiometric: $useBiometric, useLocalAuth: $useLocalAuth)';
}


}

/// @nodoc
abstract mixin class $AuthSettingsCopyWith<$Res>  {
  factory $AuthSettingsCopyWith(AuthSettings value, $Res Function(AuthSettings) _then) = _$AuthSettingsCopyWithImpl;
@useResult
$Res call({
 bool useBiometric, bool useLocalAuth
});




}
/// @nodoc
class _$AuthSettingsCopyWithImpl<$Res>
    implements $AuthSettingsCopyWith<$Res> {
  _$AuthSettingsCopyWithImpl(this._self, this._then);

  final AuthSettings _self;
  final $Res Function(AuthSettings) _then;

/// Create a copy of AuthSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? useBiometric = null,Object? useLocalAuth = null,}) {
  return _then(_self.copyWith(
useBiometric: null == useBiometric ? _self.useBiometric : useBiometric // ignore: cast_nullable_to_non_nullable
as bool,useLocalAuth: null == useLocalAuth ? _self.useLocalAuth : useLocalAuth // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthSettings].
extension AuthSettingsPatterns on AuthSettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthSettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthSettings value)  $default,){
final _that = this;
switch (_that) {
case _AuthSettings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AuthSettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool useBiometric,  bool useLocalAuth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthSettings() when $default != null:
return $default(_that.useBiometric,_that.useLocalAuth);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool useBiometric,  bool useLocalAuth)  $default,) {final _that = this;
switch (_that) {
case _AuthSettings():
return $default(_that.useBiometric,_that.useLocalAuth);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool useBiometric,  bool useLocalAuth)?  $default,) {final _that = this;
switch (_that) {
case _AuthSettings() when $default != null:
return $default(_that.useBiometric,_that.useLocalAuth);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthSettings extends AuthSettings with DiagnosticableTreeMixin {
  const _AuthSettings({required this.useBiometric, required this.useLocalAuth}): super._();
  factory _AuthSettings.fromJson(Map<String, dynamic> json) => _$AuthSettingsFromJson(json);

@override final  bool useBiometric;
@override final  bool useLocalAuth;

/// Create a copy of AuthSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthSettingsCopyWith<_AuthSettings> get copyWith => __$AuthSettingsCopyWithImpl<_AuthSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthSettingsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthSettings'))
    ..add(DiagnosticsProperty('useBiometric', useBiometric))..add(DiagnosticsProperty('useLocalAuth', useLocalAuth));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthSettings&&(identical(other.useBiometric, useBiometric) || other.useBiometric == useBiometric)&&(identical(other.useLocalAuth, useLocalAuth) || other.useLocalAuth == useLocalAuth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,useBiometric,useLocalAuth);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthSettings(useBiometric: $useBiometric, useLocalAuth: $useLocalAuth)';
}


}

/// @nodoc
abstract mixin class _$AuthSettingsCopyWith<$Res> implements $AuthSettingsCopyWith<$Res> {
  factory _$AuthSettingsCopyWith(_AuthSettings value, $Res Function(_AuthSettings) _then) = __$AuthSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool useBiometric, bool useLocalAuth
});




}
/// @nodoc
class __$AuthSettingsCopyWithImpl<$Res>
    implements _$AuthSettingsCopyWith<$Res> {
  __$AuthSettingsCopyWithImpl(this._self, this._then);

  final _AuthSettings _self;
  final $Res Function(_AuthSettings) _then;

/// Create a copy of AuthSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? useBiometric = null,Object? useLocalAuth = null,}) {
  return _then(_AuthSettings(
useBiometric: null == useBiometric ? _self.useBiometric : useBiometric // ignore: cast_nullable_to_non_nullable
as bool,useLocalAuth: null == useLocalAuth ? _self.useLocalAuth : useLocalAuth // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
