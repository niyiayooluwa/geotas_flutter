// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourseModel {

 String get id;@JsonKey(name: 'owner_id') String get ownerId; String get title; String get code;@JsonKey(name: 'invite_code') String get inviteCode; String get department;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of CourseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseModelCopyWith<CourseModel> get copyWith => _$CourseModelCopyWithImpl<CourseModel>(this as CourseModel, _$identity);

  /// Serializes this CourseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.code, code) || other.code == code)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.department, department) || other.department == department)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,title,code,inviteCode,department,createdAt);

@override
String toString() {
  return 'CourseModel(id: $id, ownerId: $ownerId, title: $title, code: $code, inviteCode: $inviteCode, department: $department, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CourseModelCopyWith<$Res>  {
  factory $CourseModelCopyWith(CourseModel value, $Res Function(CourseModel) _then) = _$CourseModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'owner_id') String ownerId, String title, String code,@JsonKey(name: 'invite_code') String inviteCode, String department,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$CourseModelCopyWithImpl<$Res>
    implements $CourseModelCopyWith<$Res> {
  _$CourseModelCopyWithImpl(this._self, this._then);

  final CourseModel _self;
  final $Res Function(CourseModel) _then;

/// Create a copy of CourseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? title = null,Object? code = null,Object? inviteCode = null,Object? department = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseModel].
extension CourseModelPatterns on CourseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseModel value)  $default,){
final _that = this;
switch (_that) {
case _CourseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CourseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'owner_id')  String ownerId,  String title,  String code, @JsonKey(name: 'invite_code')  String inviteCode,  String department, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseModel() when $default != null:
return $default(_that.id,_that.ownerId,_that.title,_that.code,_that.inviteCode,_that.department,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'owner_id')  String ownerId,  String title,  String code, @JsonKey(name: 'invite_code')  String inviteCode,  String department, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _CourseModel():
return $default(_that.id,_that.ownerId,_that.title,_that.code,_that.inviteCode,_that.department,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'owner_id')  String ownerId,  String title,  String code, @JsonKey(name: 'invite_code')  String inviteCode,  String department, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CourseModel() when $default != null:
return $default(_that.id,_that.ownerId,_that.title,_that.code,_that.inviteCode,_that.department,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CourseModel implements CourseModel {
  const _CourseModel({required this.id, @JsonKey(name: 'owner_id') required this.ownerId, required this.title, required this.code, @JsonKey(name: 'invite_code') required this.inviteCode, required this.department, @JsonKey(name: 'created_at') required this.createdAt});
  factory _CourseModel.fromJson(Map<String, dynamic> json) => _$CourseModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'owner_id') final  String ownerId;
@override final  String title;
@override final  String code;
@override@JsonKey(name: 'invite_code') final  String inviteCode;
@override final  String department;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of CourseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseModelCopyWith<_CourseModel> get copyWith => __$CourseModelCopyWithImpl<_CourseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.code, code) || other.code == code)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.department, department) || other.department == department)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,title,code,inviteCode,department,createdAt);

@override
String toString() {
  return 'CourseModel(id: $id, ownerId: $ownerId, title: $title, code: $code, inviteCode: $inviteCode, department: $department, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CourseModelCopyWith<$Res> implements $CourseModelCopyWith<$Res> {
  factory _$CourseModelCopyWith(_CourseModel value, $Res Function(_CourseModel) _then) = __$CourseModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'owner_id') String ownerId, String title, String code,@JsonKey(name: 'invite_code') String inviteCode, String department,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$CourseModelCopyWithImpl<$Res>
    implements _$CourseModelCopyWith<$Res> {
  __$CourseModelCopyWithImpl(this._self, this._then);

  final _CourseModel _self;
  final $Res Function(_CourseModel) _then;

/// Create a copy of CourseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? title = null,Object? code = null,Object? inviteCode = null,Object? department = null,Object? createdAt = null,}) {
  return _then(_CourseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$JoinCourseResponse {

 String get id;@JsonKey(name: 'course_id') String get courseId;@JsonKey(name: 'user_id') String get userId; String get role;@JsonKey(name: 'joined_at') String get joinedAt;
/// Create a copy of JoinCourseResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JoinCourseResponseCopyWith<JoinCourseResponse> get copyWith => _$JoinCourseResponseCopyWithImpl<JoinCourseResponse>(this as JoinCourseResponse, _$identity);

  /// Serializes this JoinCourseResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinCourseResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseId,userId,role,joinedAt);

@override
String toString() {
  return 'JoinCourseResponse(id: $id, courseId: $courseId, userId: $userId, role: $role, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class $JoinCourseResponseCopyWith<$Res>  {
  factory $JoinCourseResponseCopyWith(JoinCourseResponse value, $Res Function(JoinCourseResponse) _then) = _$JoinCourseResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'course_id') String courseId,@JsonKey(name: 'user_id') String userId, String role,@JsonKey(name: 'joined_at') String joinedAt
});




}
/// @nodoc
class _$JoinCourseResponseCopyWithImpl<$Res>
    implements $JoinCourseResponseCopyWith<$Res> {
  _$JoinCourseResponseCopyWithImpl(this._self, this._then);

  final JoinCourseResponse _self;
  final $Res Function(JoinCourseResponse) _then;

/// Create a copy of JoinCourseResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? courseId = null,Object? userId = null,Object? role = null,Object? joinedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JoinCourseResponse].
extension JoinCourseResponsePatterns on JoinCourseResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JoinCourseResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JoinCourseResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JoinCourseResponse value)  $default,){
final _that = this;
switch (_that) {
case _JoinCourseResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JoinCourseResponse value)?  $default,){
final _that = this;
switch (_that) {
case _JoinCourseResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'course_id')  String courseId, @JsonKey(name: 'user_id')  String userId,  String role, @JsonKey(name: 'joined_at')  String joinedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JoinCourseResponse() when $default != null:
return $default(_that.id,_that.courseId,_that.userId,_that.role,_that.joinedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'course_id')  String courseId, @JsonKey(name: 'user_id')  String userId,  String role, @JsonKey(name: 'joined_at')  String joinedAt)  $default,) {final _that = this;
switch (_that) {
case _JoinCourseResponse():
return $default(_that.id,_that.courseId,_that.userId,_that.role,_that.joinedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'course_id')  String courseId, @JsonKey(name: 'user_id')  String userId,  String role, @JsonKey(name: 'joined_at')  String joinedAt)?  $default,) {final _that = this;
switch (_that) {
case _JoinCourseResponse() when $default != null:
return $default(_that.id,_that.courseId,_that.userId,_that.role,_that.joinedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JoinCourseResponse implements JoinCourseResponse {
  const _JoinCourseResponse({required this.id, @JsonKey(name: 'course_id') required this.courseId, @JsonKey(name: 'user_id') required this.userId, required this.role, @JsonKey(name: 'joined_at') required this.joinedAt});
  factory _JoinCourseResponse.fromJson(Map<String, dynamic> json) => _$JoinCourseResponseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'course_id') final  String courseId;
@override@JsonKey(name: 'user_id') final  String userId;
@override final  String role;
@override@JsonKey(name: 'joined_at') final  String joinedAt;

/// Create a copy of JoinCourseResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JoinCourseResponseCopyWith<_JoinCourseResponse> get copyWith => __$JoinCourseResponseCopyWithImpl<_JoinCourseResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JoinCourseResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinCourseResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseId,userId,role,joinedAt);

@override
String toString() {
  return 'JoinCourseResponse(id: $id, courseId: $courseId, userId: $userId, role: $role, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class _$JoinCourseResponseCopyWith<$Res> implements $JoinCourseResponseCopyWith<$Res> {
  factory _$JoinCourseResponseCopyWith(_JoinCourseResponse value, $Res Function(_JoinCourseResponse) _then) = __$JoinCourseResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'course_id') String courseId,@JsonKey(name: 'user_id') String userId, String role,@JsonKey(name: 'joined_at') String joinedAt
});




}
/// @nodoc
class __$JoinCourseResponseCopyWithImpl<$Res>
    implements _$JoinCourseResponseCopyWith<$Res> {
  __$JoinCourseResponseCopyWithImpl(this._self, this._then);

  final _JoinCourseResponse _self;
  final $Res Function(_JoinCourseResponse) _then;

/// Create a copy of JoinCourseResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? courseId = null,Object? userId = null,Object? role = null,Object? joinedAt = null,}) {
  return _then(_JoinCourseResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$EnrolledCourse {

 String get id;@JsonKey(name: 'owner_id') String get ownerId; String get title; String get code; String get department;@JsonKey(name: 'created_at') String get createdAt; String get role;@JsonKey(name: 'matriculation_number') String? get matriculationNumber;
/// Create a copy of EnrolledCourse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnrolledCourseCopyWith<EnrolledCourse> get copyWith => _$EnrolledCourseCopyWithImpl<EnrolledCourse>(this as EnrolledCourse, _$identity);

  /// Serializes this EnrolledCourse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnrolledCourse&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.code, code) || other.code == code)&&(identical(other.department, department) || other.department == department)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.role, role) || other.role == role)&&(identical(other.matriculationNumber, matriculationNumber) || other.matriculationNumber == matriculationNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,title,code,department,createdAt,role,matriculationNumber);

@override
String toString() {
  return 'EnrolledCourse(id: $id, ownerId: $ownerId, title: $title, code: $code, department: $department, createdAt: $createdAt, role: $role, matriculationNumber: $matriculationNumber)';
}


}

/// @nodoc
abstract mixin class $EnrolledCourseCopyWith<$Res>  {
  factory $EnrolledCourseCopyWith(EnrolledCourse value, $Res Function(EnrolledCourse) _then) = _$EnrolledCourseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'owner_id') String ownerId, String title, String code, String department,@JsonKey(name: 'created_at') String createdAt, String role,@JsonKey(name: 'matriculation_number') String? matriculationNumber
});




}
/// @nodoc
class _$EnrolledCourseCopyWithImpl<$Res>
    implements $EnrolledCourseCopyWith<$Res> {
  _$EnrolledCourseCopyWithImpl(this._self, this._then);

  final EnrolledCourse _self;
  final $Res Function(EnrolledCourse) _then;

/// Create a copy of EnrolledCourse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? title = null,Object? code = null,Object? department = null,Object? createdAt = null,Object? role = null,Object? matriculationNumber = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,matriculationNumber: freezed == matriculationNumber ? _self.matriculationNumber : matriculationNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EnrolledCourse].
extension EnrolledCoursePatterns on EnrolledCourse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EnrolledCourse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EnrolledCourse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EnrolledCourse value)  $default,){
final _that = this;
switch (_that) {
case _EnrolledCourse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EnrolledCourse value)?  $default,){
final _that = this;
switch (_that) {
case _EnrolledCourse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'owner_id')  String ownerId,  String title,  String code,  String department, @JsonKey(name: 'created_at')  String createdAt,  String role, @JsonKey(name: 'matriculation_number')  String? matriculationNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EnrolledCourse() when $default != null:
return $default(_that.id,_that.ownerId,_that.title,_that.code,_that.department,_that.createdAt,_that.role,_that.matriculationNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'owner_id')  String ownerId,  String title,  String code,  String department, @JsonKey(name: 'created_at')  String createdAt,  String role, @JsonKey(name: 'matriculation_number')  String? matriculationNumber)  $default,) {final _that = this;
switch (_that) {
case _EnrolledCourse():
return $default(_that.id,_that.ownerId,_that.title,_that.code,_that.department,_that.createdAt,_that.role,_that.matriculationNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'owner_id')  String ownerId,  String title,  String code,  String department, @JsonKey(name: 'created_at')  String createdAt,  String role, @JsonKey(name: 'matriculation_number')  String? matriculationNumber)?  $default,) {final _that = this;
switch (_that) {
case _EnrolledCourse() when $default != null:
return $default(_that.id,_that.ownerId,_that.title,_that.code,_that.department,_that.createdAt,_that.role,_that.matriculationNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EnrolledCourse implements EnrolledCourse {
  const _EnrolledCourse({required this.id, @JsonKey(name: 'owner_id') required this.ownerId, required this.title, required this.code, required this.department, @JsonKey(name: 'created_at') required this.createdAt, required this.role, @JsonKey(name: 'matriculation_number') this.matriculationNumber});
  factory _EnrolledCourse.fromJson(Map<String, dynamic> json) => _$EnrolledCourseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'owner_id') final  String ownerId;
@override final  String title;
@override final  String code;
@override final  String department;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override final  String role;
@override@JsonKey(name: 'matriculation_number') final  String? matriculationNumber;

/// Create a copy of EnrolledCourse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnrolledCourseCopyWith<_EnrolledCourse> get copyWith => __$EnrolledCourseCopyWithImpl<_EnrolledCourse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EnrolledCourseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnrolledCourse&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.code, code) || other.code == code)&&(identical(other.department, department) || other.department == department)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.role, role) || other.role == role)&&(identical(other.matriculationNumber, matriculationNumber) || other.matriculationNumber == matriculationNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,title,code,department,createdAt,role,matriculationNumber);

@override
String toString() {
  return 'EnrolledCourse(id: $id, ownerId: $ownerId, title: $title, code: $code, department: $department, createdAt: $createdAt, role: $role, matriculationNumber: $matriculationNumber)';
}


}

/// @nodoc
abstract mixin class _$EnrolledCourseCopyWith<$Res> implements $EnrolledCourseCopyWith<$Res> {
  factory _$EnrolledCourseCopyWith(_EnrolledCourse value, $Res Function(_EnrolledCourse) _then) = __$EnrolledCourseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'owner_id') String ownerId, String title, String code, String department,@JsonKey(name: 'created_at') String createdAt, String role,@JsonKey(name: 'matriculation_number') String? matriculationNumber
});




}
/// @nodoc
class __$EnrolledCourseCopyWithImpl<$Res>
    implements _$EnrolledCourseCopyWith<$Res> {
  __$EnrolledCourseCopyWithImpl(this._self, this._then);

  final _EnrolledCourse _self;
  final $Res Function(_EnrolledCourse) _then;

/// Create a copy of EnrolledCourse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? title = null,Object? code = null,Object? department = null,Object? createdAt = null,Object? role = null,Object? matriculationNumber = freezed,}) {
  return _then(_EnrolledCourse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,matriculationNumber: freezed == matriculationNumber ? _self.matriculationNumber : matriculationNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
