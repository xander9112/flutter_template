// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biometrics_support.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BiometricSupportModel {

 BiometricStatus get status; BiometricTypeModel? get type; bool? get useBiometric;
/// Create a copy of BiometricSupportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiometricSupportModelCopyWith<BiometricSupportModel> get copyWith => _$BiometricSupportModelCopyWithImpl<BiometricSupportModel>(this as BiometricSupportModel, _$identity);

  /// Serializes this BiometricSupportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiometricSupportModel&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.useBiometric, useBiometric) || other.useBiometric == useBiometric));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,type,useBiometric);

@override
String toString() {
  return 'BiometricSupportModel(status: $status, type: $type, useBiometric: $useBiometric)';
}


}

/// @nodoc
abstract mixin class $BiometricSupportModelCopyWith<$Res>  {
  factory $BiometricSupportModelCopyWith(BiometricSupportModel value, $Res Function(BiometricSupportModel) _then) = _$BiometricSupportModelCopyWithImpl;
@useResult
$Res call({
 BiometricStatus status, BiometricTypeModel? type, bool? useBiometric
});




}
/// @nodoc
class _$BiometricSupportModelCopyWithImpl<$Res>
    implements $BiometricSupportModelCopyWith<$Res> {
  _$BiometricSupportModelCopyWithImpl(this._self, this._then);

  final BiometricSupportModel _self;
  final $Res Function(BiometricSupportModel) _then;

/// Create a copy of BiometricSupportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? type = freezed,Object? useBiometric = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BiometricStatus,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BiometricTypeModel?,useBiometric: freezed == useBiometric ? _self.useBiometric : useBiometric // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [BiometricSupportModel].
extension BiometricSupportModelPatterns on BiometricSupportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BiometricSupportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BiometricSupportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BiometricSupportModel value)  $default,){
final _that = this;
switch (_that) {
case _BiometricSupportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BiometricSupportModel value)?  $default,){
final _that = this;
switch (_that) {
case _BiometricSupportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BiometricStatus status,  BiometricTypeModel? type,  bool? useBiometric)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BiometricSupportModel() when $default != null:
return $default(_that.status,_that.type,_that.useBiometric);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BiometricStatus status,  BiometricTypeModel? type,  bool? useBiometric)  $default,) {final _that = this;
switch (_that) {
case _BiometricSupportModel():
return $default(_that.status,_that.type,_that.useBiometric);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BiometricStatus status,  BiometricTypeModel? type,  bool? useBiometric)?  $default,) {final _that = this;
switch (_that) {
case _BiometricSupportModel() when $default != null:
return $default(_that.status,_that.type,_that.useBiometric);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BiometricSupportModel extends BiometricSupportModel {
  const _BiometricSupportModel({this.status = BiometricStatus.notAvailable, this.type, this.useBiometric}): super._();
  factory _BiometricSupportModel.fromJson(Map<String, dynamic> json) => _$BiometricSupportModelFromJson(json);

@override@JsonKey() final  BiometricStatus status;
@override final  BiometricTypeModel? type;
@override final  bool? useBiometric;

/// Create a copy of BiometricSupportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiometricSupportModelCopyWith<_BiometricSupportModel> get copyWith => __$BiometricSupportModelCopyWithImpl<_BiometricSupportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BiometricSupportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiometricSupportModel&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.useBiometric, useBiometric) || other.useBiometric == useBiometric));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,type,useBiometric);

@override
String toString() {
  return 'BiometricSupportModel(status: $status, type: $type, useBiometric: $useBiometric)';
}


}

/// @nodoc
abstract mixin class _$BiometricSupportModelCopyWith<$Res> implements $BiometricSupportModelCopyWith<$Res> {
  factory _$BiometricSupportModelCopyWith(_BiometricSupportModel value, $Res Function(_BiometricSupportModel) _then) = __$BiometricSupportModelCopyWithImpl;
@override @useResult
$Res call({
 BiometricStatus status, BiometricTypeModel? type, bool? useBiometric
});




}
/// @nodoc
class __$BiometricSupportModelCopyWithImpl<$Res>
    implements _$BiometricSupportModelCopyWith<$Res> {
  __$BiometricSupportModelCopyWithImpl(this._self, this._then);

  final _BiometricSupportModel _self;
  final $Res Function(_BiometricSupportModel) _then;

/// Create a copy of BiometricSupportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? type = freezed,Object? useBiometric = freezed,}) {
  return _then(_BiometricSupportModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BiometricStatus,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BiometricTypeModel?,useBiometric: freezed == useBiometric ? _self.useBiometric : useBiometric // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
