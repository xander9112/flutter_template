// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthenticatedUser {

 int get id; String get email; String get login;@JsonKey(name: 'last_name') String get lastName;@JsonKey(name: 'first_name') String get firstName; String? get patronymic;@JsonKey(name: 'birthday') DateTime? get birthday;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of AuthenticatedUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedUserCopyWith<AuthenticatedUser> get copyWith => _$AuthenticatedUserCopyWithImpl<AuthenticatedUser>(this as AuthenticatedUser, _$identity);

  /// Serializes this AuthenticatedUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticatedUser&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.login, login) || other.login == login)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.patronymic, patronymic) || other.patronymic == patronymic)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,login,lastName,firstName,patronymic,birthday,createdAt,updatedAt);

@override
String toString() {
  return 'AuthenticatedUser(id: $id, email: $email, login: $login, lastName: $lastName, firstName: $firstName, patronymic: $patronymic, birthday: $birthday, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedUserCopyWith<$Res>  {
  factory $AuthenticatedUserCopyWith(AuthenticatedUser value, $Res Function(AuthenticatedUser) _then) = _$AuthenticatedUserCopyWithImpl;
@useResult
$Res call({
 int id, String email, String login,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'first_name') String firstName, String? patronymic,@JsonKey(name: 'birthday') DateTime? birthday,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$AuthenticatedUserCopyWithImpl<$Res>
    implements $AuthenticatedUserCopyWith<$Res> {
  _$AuthenticatedUserCopyWithImpl(this._self, this._then);

  final AuthenticatedUser _self;
  final $Res Function(AuthenticatedUser) _then;

/// Create a copy of AuthenticatedUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? login = null,Object? lastName = null,Object? firstName = null,Object? patronymic = freezed,Object? birthday = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,patronymic: freezed == patronymic ? _self.patronymic : patronymic // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthenticatedUser].
extension AuthenticatedUserPatterns on AuthenticatedUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthenticatedUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthenticatedUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthenticatedUser value)  $default,){
final _that = this;
switch (_that) {
case _AuthenticatedUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthenticatedUser value)?  $default,){
final _that = this;
switch (_that) {
case _AuthenticatedUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String email,  String login, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'first_name')  String firstName,  String? patronymic, @JsonKey(name: 'birthday')  DateTime? birthday, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthenticatedUser() when $default != null:
return $default(_that.id,_that.email,_that.login,_that.lastName,_that.firstName,_that.patronymic,_that.birthday,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String email,  String login, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'first_name')  String firstName,  String? patronymic, @JsonKey(name: 'birthday')  DateTime? birthday, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AuthenticatedUser():
return $default(_that.id,_that.email,_that.login,_that.lastName,_that.firstName,_that.patronymic,_that.birthday,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String email,  String login, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'first_name')  String firstName,  String? patronymic, @JsonKey(name: 'birthday')  DateTime? birthday, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AuthenticatedUser() when $default != null:
return $default(_that.id,_that.email,_that.login,_that.lastName,_that.firstName,_that.patronymic,_that.birthday,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthenticatedUser extends AuthenticatedUser {
  const _AuthenticatedUser({required this.id, required this.email, required this.login, @JsonKey(name: 'last_name') required this.lastName, @JsonKey(name: 'first_name') required this.firstName, this.patronymic, @JsonKey(name: 'birthday') this.birthday, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _AuthenticatedUser.fromJson(Map<String, dynamic> json) => _$AuthenticatedUserFromJson(json);

@override final  int id;
@override final  String email;
@override final  String login;
@override@JsonKey(name: 'last_name') final  String lastName;
@override@JsonKey(name: 'first_name') final  String firstName;
@override final  String? patronymic;
@override@JsonKey(name: 'birthday') final  DateTime? birthday;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of AuthenticatedUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticatedUserCopyWith<_AuthenticatedUser> get copyWith => __$AuthenticatedUserCopyWithImpl<_AuthenticatedUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthenticatedUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthenticatedUser&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.login, login) || other.login == login)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.patronymic, patronymic) || other.patronymic == patronymic)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,login,lastName,firstName,patronymic,birthday,createdAt,updatedAt);

@override
String toString() {
  return 'AuthenticatedUser(id: $id, email: $email, login: $login, lastName: $lastName, firstName: $firstName, patronymic: $patronymic, birthday: $birthday, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AuthenticatedUserCopyWith<$Res> implements $AuthenticatedUserCopyWith<$Res> {
  factory _$AuthenticatedUserCopyWith(_AuthenticatedUser value, $Res Function(_AuthenticatedUser) _then) = __$AuthenticatedUserCopyWithImpl;
@override @useResult
$Res call({
 int id, String email, String login,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'first_name') String firstName, String? patronymic,@JsonKey(name: 'birthday') DateTime? birthday,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$AuthenticatedUserCopyWithImpl<$Res>
    implements _$AuthenticatedUserCopyWith<$Res> {
  __$AuthenticatedUserCopyWithImpl(this._self, this._then);

  final _AuthenticatedUser _self;
  final $Res Function(_AuthenticatedUser) _then;

/// Create a copy of AuthenticatedUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? login = null,Object? lastName = null,Object? firstName = null,Object? patronymic = freezed,Object? birthday = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_AuthenticatedUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,patronymic: freezed == patronymic ? _self.patronymic : patronymic // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
