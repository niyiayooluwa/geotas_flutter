// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateCourseRequest {

 String get title; String get code; String get department;
/// Create a copy of CreateCourseRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCourseRequestCopyWith<CreateCourseRequest> get copyWith => _$CreateCourseRequestCopyWithImpl<CreateCourseRequest>(this as CreateCourseRequest, _$identity);

  /// Serializes this CreateCourseRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCourseRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.code, code) || other.code == code)&&(identical(other.department, department) || other.department == department));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,code,department);

@override
String toString() {
  return 'CreateCourseRequest(title: $title, code: $code, department: $department)';
}


}

/// @nodoc
abstract mixin class $CreateCourseRequestCopyWith<$Res>  {
  factory $CreateCourseRequestCopyWith(CreateCourseRequest value, $Res Function(CreateCourseRequest) _then) = _$CreateCourseRequestCopyWithImpl;
@useResult
$Res call({
 String title, String code, String department
});




}
/// @nodoc
class _$CreateCourseRequestCopyWithImpl<$Res>
    implements $CreateCourseRequestCopyWith<$Res> {
  _$CreateCourseRequestCopyWithImpl(this._self, this._then);

  final CreateCourseRequest _self;
  final $Res Function(CreateCourseRequest) _then;

/// Create a copy of CreateCourseRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? code = null,Object? department = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateCourseRequest].
extension CreateCourseRequestPatterns on CreateCourseRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateCourseRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCourseRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateCourseRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateCourseRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateCourseRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateCourseRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String code,  String department)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCourseRequest() when $default != null:
return $default(_that.title,_that.code,_that.department);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String code,  String department)  $default,) {final _that = this;
switch (_that) {
case _CreateCourseRequest():
return $default(_that.title,_that.code,_that.department);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String code,  String department)?  $default,) {final _that = this;
switch (_that) {
case _CreateCourseRequest() when $default != null:
return $default(_that.title,_that.code,_that.department);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateCourseRequest implements CreateCourseRequest {
  const _CreateCourseRequest({required this.title, required this.code, required this.department});
  factory _CreateCourseRequest.fromJson(Map<String, dynamic> json) => _$CreateCourseRequestFromJson(json);

@override final  String title;
@override final  String code;
@override final  String department;

/// Create a copy of CreateCourseRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCourseRequestCopyWith<_CreateCourseRequest> get copyWith => __$CreateCourseRequestCopyWithImpl<_CreateCourseRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateCourseRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCourseRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.code, code) || other.code == code)&&(identical(other.department, department) || other.department == department));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,code,department);

@override
String toString() {
  return 'CreateCourseRequest(title: $title, code: $code, department: $department)';
}


}

/// @nodoc
abstract mixin class _$CreateCourseRequestCopyWith<$Res> implements $CreateCourseRequestCopyWith<$Res> {
  factory _$CreateCourseRequestCopyWith(_CreateCourseRequest value, $Res Function(_CreateCourseRequest) _then) = __$CreateCourseRequestCopyWithImpl;
@override @useResult
$Res call({
 String title, String code, String department
});




}
/// @nodoc
class __$CreateCourseRequestCopyWithImpl<$Res>
    implements _$CreateCourseRequestCopyWith<$Res> {
  __$CreateCourseRequestCopyWithImpl(this._self, this._then);

  final _CreateCourseRequest _self;
  final $Res Function(_CreateCourseRequest) _then;

/// Create a copy of CreateCourseRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? code = null,Object? department = null,}) {
  return _then(_CreateCourseRequest(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$JoinCourseRequest {

@JsonKey(name: 'invite_code') String get inviteCode;@JsonKey(name: 'matriculation_number') String get matriculationNumber;
/// Create a copy of JoinCourseRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JoinCourseRequestCopyWith<JoinCourseRequest> get copyWith => _$JoinCourseRequestCopyWithImpl<JoinCourseRequest>(this as JoinCourseRequest, _$identity);

  /// Serializes this JoinCourseRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinCourseRequest&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.matriculationNumber, matriculationNumber) || other.matriculationNumber == matriculationNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inviteCode,matriculationNumber);

@override
String toString() {
  return 'JoinCourseRequest(inviteCode: $inviteCode, matriculationNumber: $matriculationNumber)';
}


}

/// @nodoc
abstract mixin class $JoinCourseRequestCopyWith<$Res>  {
  factory $JoinCourseRequestCopyWith(JoinCourseRequest value, $Res Function(JoinCourseRequest) _then) = _$JoinCourseRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'invite_code') String inviteCode,@JsonKey(name: 'matriculation_number') String matriculationNumber
});




}
/// @nodoc
class _$JoinCourseRequestCopyWithImpl<$Res>
    implements $JoinCourseRequestCopyWith<$Res> {
  _$JoinCourseRequestCopyWithImpl(this._self, this._then);

  final JoinCourseRequest _self;
  final $Res Function(JoinCourseRequest) _then;

/// Create a copy of JoinCourseRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inviteCode = null,Object? matriculationNumber = null,}) {
  return _then(_self.copyWith(
inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,matriculationNumber: null == matriculationNumber ? _self.matriculationNumber : matriculationNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JoinCourseRequest].
extension JoinCourseRequestPatterns on JoinCourseRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JoinCourseRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JoinCourseRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JoinCourseRequest value)  $default,){
final _that = this;
switch (_that) {
case _JoinCourseRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JoinCourseRequest value)?  $default,){
final _that = this;
switch (_that) {
case _JoinCourseRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'invite_code')  String inviteCode, @JsonKey(name: 'matriculation_number')  String matriculationNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JoinCourseRequest() when $default != null:
return $default(_that.inviteCode,_that.matriculationNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'invite_code')  String inviteCode, @JsonKey(name: 'matriculation_number')  String matriculationNumber)  $default,) {final _that = this;
switch (_that) {
case _JoinCourseRequest():
return $default(_that.inviteCode,_that.matriculationNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'invite_code')  String inviteCode, @JsonKey(name: 'matriculation_number')  String matriculationNumber)?  $default,) {final _that = this;
switch (_that) {
case _JoinCourseRequest() when $default != null:
return $default(_that.inviteCode,_that.matriculationNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JoinCourseRequest implements JoinCourseRequest {
  const _JoinCourseRequest({@JsonKey(name: 'invite_code') required this.inviteCode, @JsonKey(name: 'matriculation_number') required this.matriculationNumber});
  factory _JoinCourseRequest.fromJson(Map<String, dynamic> json) => _$JoinCourseRequestFromJson(json);

@override@JsonKey(name: 'invite_code') final  String inviteCode;
@override@JsonKey(name: 'matriculation_number') final  String matriculationNumber;

/// Create a copy of JoinCourseRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JoinCourseRequestCopyWith<_JoinCourseRequest> get copyWith => __$JoinCourseRequestCopyWithImpl<_JoinCourseRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JoinCourseRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinCourseRequest&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.matriculationNumber, matriculationNumber) || other.matriculationNumber == matriculationNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inviteCode,matriculationNumber);

@override
String toString() {
  return 'JoinCourseRequest(inviteCode: $inviteCode, matriculationNumber: $matriculationNumber)';
}


}

/// @nodoc
abstract mixin class _$JoinCourseRequestCopyWith<$Res> implements $JoinCourseRequestCopyWith<$Res> {
  factory _$JoinCourseRequestCopyWith(_JoinCourseRequest value, $Res Function(_JoinCourseRequest) _then) = __$JoinCourseRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'invite_code') String inviteCode,@JsonKey(name: 'matriculation_number') String matriculationNumber
});




}
/// @nodoc
class __$JoinCourseRequestCopyWithImpl<$Res>
    implements _$JoinCourseRequestCopyWith<$Res> {
  __$JoinCourseRequestCopyWithImpl(this._self, this._then);

  final _JoinCourseRequest _self;
  final $Res Function(_JoinCourseRequest) _then;

/// Create a copy of JoinCourseRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inviteCode = null,Object? matriculationNumber = null,}) {
  return _then(_JoinCourseRequest(
inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,matriculationNumber: null == matriculationNumber ? _self.matriculationNumber : matriculationNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
