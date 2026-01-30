// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocalAuthState {

 StateStatus get status; bool get hasPinCode; String? get error; String? get tempCode;
/// Create a copy of LocalAuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalAuthStateCopyWith<LocalAuthState> get copyWith => _$LocalAuthStateCopyWithImpl<LocalAuthState>(this as LocalAuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalAuthState&&(identical(other.status, status) || other.status == status)&&(identical(other.hasPinCode, hasPinCode) || other.hasPinCode == hasPinCode)&&(identical(other.error, error) || other.error == error)&&(identical(other.tempCode, tempCode) || other.tempCode == tempCode));
}


@override
int get hashCode => Object.hash(runtimeType,status,hasPinCode,error,tempCode);

@override
String toString() {
  return 'LocalAuthState(status: $status, hasPinCode: $hasPinCode, error: $error, tempCode: $tempCode)';
}


}

/// @nodoc
abstract mixin class $LocalAuthStateCopyWith<$Res>  {
  factory $LocalAuthStateCopyWith(LocalAuthState value, $Res Function(LocalAuthState) _then) = _$LocalAuthStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, bool hasPinCode, String? error, String? tempCode
});




}
/// @nodoc
class _$LocalAuthStateCopyWithImpl<$Res>
    implements $LocalAuthStateCopyWith<$Res> {
  _$LocalAuthStateCopyWithImpl(this._self, this._then);

  final LocalAuthState _self;
  final $Res Function(LocalAuthState) _then;

/// Create a copy of LocalAuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? hasPinCode = null,Object? error = freezed,Object? tempCode = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,hasPinCode: null == hasPinCode ? _self.hasPinCode : hasPinCode // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,tempCode: freezed == tempCode ? _self.tempCode : tempCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalAuthState].
extension LocalAuthStatePatterns on LocalAuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Initial value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Initial value)  $default,){
final _that = this;
switch (_that) {
case _Initial():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Initial value)?  $default,){
final _that = this;
switch (_that) {
case _Initial() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  bool hasPinCode,  String? error,  String? tempCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.status,_that.hasPinCode,_that.error,_that.tempCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  bool hasPinCode,  String? error,  String? tempCode)  $default,) {final _that = this;
switch (_that) {
case _Initial():
return $default(_that.status,_that.hasPinCode,_that.error,_that.tempCode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  bool hasPinCode,  String? error,  String? tempCode)?  $default,) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.status,_that.hasPinCode,_that.error,_that.tempCode);case _:
  return null;

}
}

}

/// @nodoc


class _Initial extends LocalAuthState {
  const _Initial({this.status = StateStatus.notReady, this.hasPinCode = false, this.error, this.tempCode}): super._();
  

@override@JsonKey() final  StateStatus status;
@override@JsonKey() final  bool hasPinCode;
@override final  String? error;
@override final  String? tempCode;

/// Create a copy of LocalAuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.status, status) || other.status == status)&&(identical(other.hasPinCode, hasPinCode) || other.hasPinCode == hasPinCode)&&(identical(other.error, error) || other.error == error)&&(identical(other.tempCode, tempCode) || other.tempCode == tempCode));
}


@override
int get hashCode => Object.hash(runtimeType,status,hasPinCode,error,tempCode);

@override
String toString() {
  return 'LocalAuthState(status: $status, hasPinCode: $hasPinCode, error: $error, tempCode: $tempCode)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $LocalAuthStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, bool hasPinCode, String? error, String? tempCode
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of LocalAuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? hasPinCode = null,Object? error = freezed,Object? tempCode = freezed,}) {
  return _then(_Initial(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,hasPinCode: null == hasPinCode ? _self.hasPinCode : hasPinCode // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,tempCode: freezed == tempCode ? _self.tempCode : tempCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
