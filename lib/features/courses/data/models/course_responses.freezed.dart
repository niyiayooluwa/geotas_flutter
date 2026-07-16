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
mixin _$JoinCourseResponse {

 String get id;@JsonKey(name: 'course_id') String get courseId;@JsonKey(name: 'user_id') String get userId; String get role;@JsonKey(name: 'matriculation_number') String get matriculationNumber;@JsonKey(name: 'joined_at') String get joinedAt;
/// Create a copy of JoinCourseResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JoinCourseResponseCopyWith<JoinCourseResponse> get copyWith => _$JoinCourseResponseCopyWithImpl<JoinCourseResponse>(this as JoinCourseResponse, _$identity);

  /// Serializes this JoinCourseResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinCourseResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.matriculationNumber, matriculationNumber) || other.matriculationNumber == matriculationNumber)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseId,userId,role,matriculationNumber,joinedAt);

@override
String toString() {
  return 'JoinCourseResponse(id: $id, courseId: $courseId, userId: $userId, role: $role, matriculationNumber: $matriculationNumber, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class $JoinCourseResponseCopyWith<$Res>  {
  factory $JoinCourseResponseCopyWith(JoinCourseResponse value, $Res Function(JoinCourseResponse) _then) = _$JoinCourseResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'course_id') String courseId,@JsonKey(name: 'user_id') String userId, String role,@JsonKey(name: 'matriculation_number') String matriculationNumber,@JsonKey(name: 'joined_at') String joinedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? courseId = null,Object? userId = null,Object? role = null,Object? matriculationNumber = null,Object? joinedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,matriculationNumber: null == matriculationNumber ? _self.matriculationNumber : matriculationNumber // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'course_id')  String courseId, @JsonKey(name: 'user_id')  String userId,  String role, @JsonKey(name: 'matriculation_number')  String matriculationNumber, @JsonKey(name: 'joined_at')  String joinedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JoinCourseResponse() when $default != null:
return $default(_that.id,_that.courseId,_that.userId,_that.role,_that.matriculationNumber,_that.joinedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'course_id')  String courseId, @JsonKey(name: 'user_id')  String userId,  String role, @JsonKey(name: 'matriculation_number')  String matriculationNumber, @JsonKey(name: 'joined_at')  String joinedAt)  $default,) {final _that = this;
switch (_that) {
case _JoinCourseResponse():
return $default(_that.id,_that.courseId,_that.userId,_that.role,_that.matriculationNumber,_that.joinedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'course_id')  String courseId, @JsonKey(name: 'user_id')  String userId,  String role, @JsonKey(name: 'matriculation_number')  String matriculationNumber, @JsonKey(name: 'joined_at')  String joinedAt)?  $default,) {final _that = this;
switch (_that) {
case _JoinCourseResponse() when $default != null:
return $default(_that.id,_that.courseId,_that.userId,_that.role,_that.matriculationNumber,_that.joinedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JoinCourseResponse implements JoinCourseResponse {
  const _JoinCourseResponse({required this.id, @JsonKey(name: 'course_id') required this.courseId, @JsonKey(name: 'user_id') required this.userId, required this.role, @JsonKey(name: 'matriculation_number') required this.matriculationNumber, @JsonKey(name: 'joined_at') required this.joinedAt});
  factory _JoinCourseResponse.fromJson(Map<String, dynamic> json) => _$JoinCourseResponseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'course_id') final  String courseId;
@override@JsonKey(name: 'user_id') final  String userId;
@override final  String role;
@override@JsonKey(name: 'matriculation_number') final  String matriculationNumber;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinCourseResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.matriculationNumber, matriculationNumber) || other.matriculationNumber == matriculationNumber)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseId,userId,role,matriculationNumber,joinedAt);

@override
String toString() {
  return 'JoinCourseResponse(id: $id, courseId: $courseId, userId: $userId, role: $role, matriculationNumber: $matriculationNumber, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class _$JoinCourseResponseCopyWith<$Res> implements $JoinCourseResponseCopyWith<$Res> {
  factory _$JoinCourseResponseCopyWith(_JoinCourseResponse value, $Res Function(_JoinCourseResponse) _then) = __$JoinCourseResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'course_id') String courseId,@JsonKey(name: 'user_id') String userId, String role,@JsonKey(name: 'matriculation_number') String matriculationNumber,@JsonKey(name: 'joined_at') String joinedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? courseId = null,Object? userId = null,Object? role = null,Object? matriculationNumber = null,Object? joinedAt = null,}) {
  return _then(_JoinCourseResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,matriculationNumber: null == matriculationNumber ? _self.matriculationNumber : matriculationNumber // ignore: cast_nullable_to_non_nullable
as String,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CourseModel {

 String get id;@JsonKey(name: 'owner_id') String get ownerId; String get title; String get code;@JsonKey(name: 'invite_code') String get inviteCode; String get department;@JsonKey(name: 'student_count') int get studentCount;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'confidence_threshold') double get confidenceThreshold;
/// Create a copy of CourseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseModelCopyWith<CourseModel> get copyWith => _$CourseModelCopyWithImpl<CourseModel>(this as CourseModel, _$identity);

  /// Serializes this CourseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.code, code) || other.code == code)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.department, department) || other.department == department)&&(identical(other.studentCount, studentCount) || other.studentCount == studentCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.confidenceThreshold, confidenceThreshold) || other.confidenceThreshold == confidenceThreshold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,title,code,inviteCode,department,studentCount,createdAt,confidenceThreshold);

@override
String toString() {
  return 'CourseModel(id: $id, ownerId: $ownerId, title: $title, code: $code, inviteCode: $inviteCode, department: $department, studentCount: $studentCount, createdAt: $createdAt, confidenceThreshold: $confidenceThreshold)';
}


}

/// @nodoc
abstract mixin class $CourseModelCopyWith<$Res>  {
  factory $CourseModelCopyWith(CourseModel value, $Res Function(CourseModel) _then) = _$CourseModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'owner_id') String ownerId, String title, String code,@JsonKey(name: 'invite_code') String inviteCode, String department,@JsonKey(name: 'student_count') int studentCount,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'confidence_threshold') double confidenceThreshold
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? title = null,Object? code = null,Object? inviteCode = null,Object? department = null,Object? studentCount = null,Object? createdAt = null,Object? confidenceThreshold = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,studentCount: null == studentCount ? _self.studentCount : studentCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,confidenceThreshold: null == confidenceThreshold ? _self.confidenceThreshold : confidenceThreshold // ignore: cast_nullable_to_non_nullable
as double,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'owner_id')  String ownerId,  String title,  String code, @JsonKey(name: 'invite_code')  String inviteCode,  String department, @JsonKey(name: 'student_count')  int studentCount, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'confidence_threshold')  double confidenceThreshold)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseModel() when $default != null:
return $default(_that.id,_that.ownerId,_that.title,_that.code,_that.inviteCode,_that.department,_that.studentCount,_that.createdAt,_that.confidenceThreshold);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'owner_id')  String ownerId,  String title,  String code, @JsonKey(name: 'invite_code')  String inviteCode,  String department, @JsonKey(name: 'student_count')  int studentCount, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'confidence_threshold')  double confidenceThreshold)  $default,) {final _that = this;
switch (_that) {
case _CourseModel():
return $default(_that.id,_that.ownerId,_that.title,_that.code,_that.inviteCode,_that.department,_that.studentCount,_that.createdAt,_that.confidenceThreshold);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'owner_id')  String ownerId,  String title,  String code, @JsonKey(name: 'invite_code')  String inviteCode,  String department, @JsonKey(name: 'student_count')  int studentCount, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'confidence_threshold')  double confidenceThreshold)?  $default,) {final _that = this;
switch (_that) {
case _CourseModel() when $default != null:
return $default(_that.id,_that.ownerId,_that.title,_that.code,_that.inviteCode,_that.department,_that.studentCount,_that.createdAt,_that.confidenceThreshold);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CourseModel implements CourseModel {
  const _CourseModel({required this.id, @JsonKey(name: 'owner_id') required this.ownerId, required this.title, required this.code, @JsonKey(name: 'invite_code') required this.inviteCode, required this.department, @JsonKey(name: 'student_count') this.studentCount = 0, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'confidence_threshold') this.confidenceThreshold = 0.75});
  factory _CourseModel.fromJson(Map<String, dynamic> json) => _$CourseModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'owner_id') final  String ownerId;
@override final  String title;
@override final  String code;
@override@JsonKey(name: 'invite_code') final  String inviteCode;
@override final  String department;
@override@JsonKey(name: 'student_count') final  int studentCount;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'confidence_threshold') final  double confidenceThreshold;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.code, code) || other.code == code)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.department, department) || other.department == department)&&(identical(other.studentCount, studentCount) || other.studentCount == studentCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.confidenceThreshold, confidenceThreshold) || other.confidenceThreshold == confidenceThreshold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,title,code,inviteCode,department,studentCount,createdAt,confidenceThreshold);

@override
String toString() {
  return 'CourseModel(id: $id, ownerId: $ownerId, title: $title, code: $code, inviteCode: $inviteCode, department: $department, studentCount: $studentCount, createdAt: $createdAt, confidenceThreshold: $confidenceThreshold)';
}


}

/// @nodoc
abstract mixin class _$CourseModelCopyWith<$Res> implements $CourseModelCopyWith<$Res> {
  factory _$CourseModelCopyWith(_CourseModel value, $Res Function(_CourseModel) _then) = __$CourseModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'owner_id') String ownerId, String title, String code,@JsonKey(name: 'invite_code') String inviteCode, String department,@JsonKey(name: 'student_count') int studentCount,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'confidence_threshold') double confidenceThreshold
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? title = null,Object? code = null,Object? inviteCode = null,Object? department = null,Object? studentCount = null,Object? createdAt = null,Object? confidenceThreshold = null,}) {
  return _then(_CourseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,studentCount: null == studentCount ? _self.studentCount : studentCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,confidenceThreshold: null == confidenceThreshold ? _self.confidenceThreshold : confidenceThreshold // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$EnrolledCourse {

 String get id;@JsonKey(name: 'owner_id') String get ownerId; String get title; String get code; String get department;@JsonKey(name: 'invite_code') String get inviteCode;@JsonKey(name: 'created_at') String get createdAt; String get role;@JsonKey(name: 'matriculation_number') String? get matriculationNumber;@JsonKey(name: 'student_count') int get studentCount;@JsonKey(name: 'confidence_threshold') double get confidenceThreshold;
/// Create a copy of EnrolledCourse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnrolledCourseCopyWith<EnrolledCourse> get copyWith => _$EnrolledCourseCopyWithImpl<EnrolledCourse>(this as EnrolledCourse, _$identity);

  /// Serializes this EnrolledCourse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnrolledCourse&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.code, code) || other.code == code)&&(identical(other.department, department) || other.department == department)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.role, role) || other.role == role)&&(identical(other.matriculationNumber, matriculationNumber) || other.matriculationNumber == matriculationNumber)&&(identical(other.studentCount, studentCount) || other.studentCount == studentCount)&&(identical(other.confidenceThreshold, confidenceThreshold) || other.confidenceThreshold == confidenceThreshold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,title,code,department,inviteCode,createdAt,role,matriculationNumber,studentCount,confidenceThreshold);

@override
String toString() {
  return 'EnrolledCourse(id: $id, ownerId: $ownerId, title: $title, code: $code, department: $department, inviteCode: $inviteCode, createdAt: $createdAt, role: $role, matriculationNumber: $matriculationNumber, studentCount: $studentCount, confidenceThreshold: $confidenceThreshold)';
}


}

/// @nodoc
abstract mixin class $EnrolledCourseCopyWith<$Res>  {
  factory $EnrolledCourseCopyWith(EnrolledCourse value, $Res Function(EnrolledCourse) _then) = _$EnrolledCourseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'owner_id') String ownerId, String title, String code, String department,@JsonKey(name: 'invite_code') String inviteCode,@JsonKey(name: 'created_at') String createdAt, String role,@JsonKey(name: 'matriculation_number') String? matriculationNumber,@JsonKey(name: 'student_count') int studentCount,@JsonKey(name: 'confidence_threshold') double confidenceThreshold
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? title = null,Object? code = null,Object? department = null,Object? inviteCode = null,Object? createdAt = null,Object? role = null,Object? matriculationNumber = freezed,Object? studentCount = null,Object? confidenceThreshold = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,matriculationNumber: freezed == matriculationNumber ? _self.matriculationNumber : matriculationNumber // ignore: cast_nullable_to_non_nullable
as String?,studentCount: null == studentCount ? _self.studentCount : studentCount // ignore: cast_nullable_to_non_nullable
as int,confidenceThreshold: null == confidenceThreshold ? _self.confidenceThreshold : confidenceThreshold // ignore: cast_nullable_to_non_nullable
as double,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'owner_id')  String ownerId,  String title,  String code,  String department, @JsonKey(name: 'invite_code')  String inviteCode, @JsonKey(name: 'created_at')  String createdAt,  String role, @JsonKey(name: 'matriculation_number')  String? matriculationNumber, @JsonKey(name: 'student_count')  int studentCount, @JsonKey(name: 'confidence_threshold')  double confidenceThreshold)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EnrolledCourse() when $default != null:
return $default(_that.id,_that.ownerId,_that.title,_that.code,_that.department,_that.inviteCode,_that.createdAt,_that.role,_that.matriculationNumber,_that.studentCount,_that.confidenceThreshold);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'owner_id')  String ownerId,  String title,  String code,  String department, @JsonKey(name: 'invite_code')  String inviteCode, @JsonKey(name: 'created_at')  String createdAt,  String role, @JsonKey(name: 'matriculation_number')  String? matriculationNumber, @JsonKey(name: 'student_count')  int studentCount, @JsonKey(name: 'confidence_threshold')  double confidenceThreshold)  $default,) {final _that = this;
switch (_that) {
case _EnrolledCourse():
return $default(_that.id,_that.ownerId,_that.title,_that.code,_that.department,_that.inviteCode,_that.createdAt,_that.role,_that.matriculationNumber,_that.studentCount,_that.confidenceThreshold);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'owner_id')  String ownerId,  String title,  String code,  String department, @JsonKey(name: 'invite_code')  String inviteCode, @JsonKey(name: 'created_at')  String createdAt,  String role, @JsonKey(name: 'matriculation_number')  String? matriculationNumber, @JsonKey(name: 'student_count')  int studentCount, @JsonKey(name: 'confidence_threshold')  double confidenceThreshold)?  $default,) {final _that = this;
switch (_that) {
case _EnrolledCourse() when $default != null:
return $default(_that.id,_that.ownerId,_that.title,_that.code,_that.department,_that.inviteCode,_that.createdAt,_that.role,_that.matriculationNumber,_that.studentCount,_that.confidenceThreshold);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EnrolledCourse implements EnrolledCourse {
  const _EnrolledCourse({required this.id, @JsonKey(name: 'owner_id') required this.ownerId, required this.title, required this.code, required this.department, @JsonKey(name: 'invite_code') required this.inviteCode, @JsonKey(name: 'created_at') required this.createdAt, required this.role, @JsonKey(name: 'matriculation_number') this.matriculationNumber, @JsonKey(name: 'student_count') this.studentCount = 0, @JsonKey(name: 'confidence_threshold') this.confidenceThreshold = 0.75});
  factory _EnrolledCourse.fromJson(Map<String, dynamic> json) => _$EnrolledCourseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'owner_id') final  String ownerId;
@override final  String title;
@override final  String code;
@override final  String department;
@override@JsonKey(name: 'invite_code') final  String inviteCode;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override final  String role;
@override@JsonKey(name: 'matriculation_number') final  String? matriculationNumber;
@override@JsonKey(name: 'student_count') final  int studentCount;
@override@JsonKey(name: 'confidence_threshold') final  double confidenceThreshold;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnrolledCourse&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.code, code) || other.code == code)&&(identical(other.department, department) || other.department == department)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.role, role) || other.role == role)&&(identical(other.matriculationNumber, matriculationNumber) || other.matriculationNumber == matriculationNumber)&&(identical(other.studentCount, studentCount) || other.studentCount == studentCount)&&(identical(other.confidenceThreshold, confidenceThreshold) || other.confidenceThreshold == confidenceThreshold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,title,code,department,inviteCode,createdAt,role,matriculationNumber,studentCount,confidenceThreshold);

@override
String toString() {
  return 'EnrolledCourse(id: $id, ownerId: $ownerId, title: $title, code: $code, department: $department, inviteCode: $inviteCode, createdAt: $createdAt, role: $role, matriculationNumber: $matriculationNumber, studentCount: $studentCount, confidenceThreshold: $confidenceThreshold)';
}


}

/// @nodoc
abstract mixin class _$EnrolledCourseCopyWith<$Res> implements $EnrolledCourseCopyWith<$Res> {
  factory _$EnrolledCourseCopyWith(_EnrolledCourse value, $Res Function(_EnrolledCourse) _then) = __$EnrolledCourseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'owner_id') String ownerId, String title, String code, String department,@JsonKey(name: 'invite_code') String inviteCode,@JsonKey(name: 'created_at') String createdAt, String role,@JsonKey(name: 'matriculation_number') String? matriculationNumber,@JsonKey(name: 'student_count') int studentCount,@JsonKey(name: 'confidence_threshold') double confidenceThreshold
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? title = null,Object? code = null,Object? department = null,Object? inviteCode = null,Object? createdAt = null,Object? role = null,Object? matriculationNumber = freezed,Object? studentCount = null,Object? confidenceThreshold = null,}) {
  return _then(_EnrolledCourse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,matriculationNumber: freezed == matriculationNumber ? _self.matriculationNumber : matriculationNumber // ignore: cast_nullable_to_non_nullable
as String?,studentCount: null == studentCount ? _self.studentCount : studentCount // ignore: cast_nullable_to_non_nullable
as int,confidenceThreshold: null == confidenceThreshold ? _self.confidenceThreshold : confidenceThreshold // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$CourseMemberModel {

@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName; String get email;@JsonKey(name: 'avatar_url') String? get avatarUrl; String get role;@JsonKey(name: 'matriculation_number') String? get matriculationNumber;@JsonKey(name: 'co_lecturer') bool get coLecturer;@JsonKey(name: 'joined_at') String get joinedAt;
/// Create a copy of CourseMemberModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseMemberModelCopyWith<CourseMemberModel> get copyWith => _$CourseMemberModelCopyWithImpl<CourseMemberModel>(this as CourseMemberModel, _$identity);

  /// Serializes this CourseMemberModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseMemberModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.role, role) || other.role == role)&&(identical(other.matriculationNumber, matriculationNumber) || other.matriculationNumber == matriculationNumber)&&(identical(other.coLecturer, coLecturer) || other.coLecturer == coLecturer)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,firstName,lastName,email,avatarUrl,role,matriculationNumber,coLecturer,joinedAt);

@override
String toString() {
  return 'CourseMemberModel(userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, avatarUrl: $avatarUrl, role: $role, matriculationNumber: $matriculationNumber, coLecturer: $coLecturer, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class $CourseMemberModelCopyWith<$Res>  {
  factory $CourseMemberModelCopyWith(CourseMemberModel value, $Res Function(CourseMemberModel) _then) = _$CourseMemberModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String email,@JsonKey(name: 'avatar_url') String? avatarUrl, String role,@JsonKey(name: 'matriculation_number') String? matriculationNumber,@JsonKey(name: 'co_lecturer') bool coLecturer,@JsonKey(name: 'joined_at') String joinedAt
});




}
/// @nodoc
class _$CourseMemberModelCopyWithImpl<$Res>
    implements $CourseMemberModelCopyWith<$Res> {
  _$CourseMemberModelCopyWithImpl(this._self, this._then);

  final CourseMemberModel _self;
  final $Res Function(CourseMemberModel) _then;

/// Create a copy of CourseMemberModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? firstName = null,Object? lastName = null,Object? email = null,Object? avatarUrl = freezed,Object? role = null,Object? matriculationNumber = freezed,Object? coLecturer = null,Object? joinedAt = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,matriculationNumber: freezed == matriculationNumber ? _self.matriculationNumber : matriculationNumber // ignore: cast_nullable_to_non_nullable
as String?,coLecturer: null == coLecturer ? _self.coLecturer : coLecturer // ignore: cast_nullable_to_non_nullable
as bool,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseMemberModel].
extension CourseMemberModelPatterns on CourseMemberModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseMemberModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseMemberModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseMemberModel value)  $default,){
final _that = this;
switch (_that) {
case _CourseMemberModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseMemberModel value)?  $default,){
final _that = this;
switch (_that) {
case _CourseMemberModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String email, @JsonKey(name: 'avatar_url')  String? avatarUrl,  String role, @JsonKey(name: 'matriculation_number')  String? matriculationNumber, @JsonKey(name: 'co_lecturer')  bool coLecturer, @JsonKey(name: 'joined_at')  String joinedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseMemberModel() when $default != null:
return $default(_that.userId,_that.firstName,_that.lastName,_that.email,_that.avatarUrl,_that.role,_that.matriculationNumber,_that.coLecturer,_that.joinedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String email, @JsonKey(name: 'avatar_url')  String? avatarUrl,  String role, @JsonKey(name: 'matriculation_number')  String? matriculationNumber, @JsonKey(name: 'co_lecturer')  bool coLecturer, @JsonKey(name: 'joined_at')  String joinedAt)  $default,) {final _that = this;
switch (_that) {
case _CourseMemberModel():
return $default(_that.userId,_that.firstName,_that.lastName,_that.email,_that.avatarUrl,_that.role,_that.matriculationNumber,_that.coLecturer,_that.joinedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String email, @JsonKey(name: 'avatar_url')  String? avatarUrl,  String role, @JsonKey(name: 'matriculation_number')  String? matriculationNumber, @JsonKey(name: 'co_lecturer')  bool coLecturer, @JsonKey(name: 'joined_at')  String joinedAt)?  $default,) {final _that = this;
switch (_that) {
case _CourseMemberModel() when $default != null:
return $default(_that.userId,_that.firstName,_that.lastName,_that.email,_that.avatarUrl,_that.role,_that.matriculationNumber,_that.coLecturer,_that.joinedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CourseMemberModel implements CourseMemberModel {
  const _CourseMemberModel({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, required this.email, @JsonKey(name: 'avatar_url') this.avatarUrl, required this.role, @JsonKey(name: 'matriculation_number') this.matriculationNumber, @JsonKey(name: 'co_lecturer') required this.coLecturer, @JsonKey(name: 'joined_at') required this.joinedAt});
  factory _CourseMemberModel.fromJson(Map<String, dynamic> json) => _$CourseMemberModelFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override final  String email;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override final  String role;
@override@JsonKey(name: 'matriculation_number') final  String? matriculationNumber;
@override@JsonKey(name: 'co_lecturer') final  bool coLecturer;
@override@JsonKey(name: 'joined_at') final  String joinedAt;

/// Create a copy of CourseMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseMemberModelCopyWith<_CourseMemberModel> get copyWith => __$CourseMemberModelCopyWithImpl<_CourseMemberModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseMemberModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseMemberModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.role, role) || other.role == role)&&(identical(other.matriculationNumber, matriculationNumber) || other.matriculationNumber == matriculationNumber)&&(identical(other.coLecturer, coLecturer) || other.coLecturer == coLecturer)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,firstName,lastName,email,avatarUrl,role,matriculationNumber,coLecturer,joinedAt);

@override
String toString() {
  return 'CourseMemberModel(userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, avatarUrl: $avatarUrl, role: $role, matriculationNumber: $matriculationNumber, coLecturer: $coLecturer, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class _$CourseMemberModelCopyWith<$Res> implements $CourseMemberModelCopyWith<$Res> {
  factory _$CourseMemberModelCopyWith(_CourseMemberModel value, $Res Function(_CourseMemberModel) _then) = __$CourseMemberModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String email,@JsonKey(name: 'avatar_url') String? avatarUrl, String role,@JsonKey(name: 'matriculation_number') String? matriculationNumber,@JsonKey(name: 'co_lecturer') bool coLecturer,@JsonKey(name: 'joined_at') String joinedAt
});




}
/// @nodoc
class __$CourseMemberModelCopyWithImpl<$Res>
    implements _$CourseMemberModelCopyWith<$Res> {
  __$CourseMemberModelCopyWithImpl(this._self, this._then);

  final _CourseMemberModel _self;
  final $Res Function(_CourseMemberModel) _then;

/// Create a copy of CourseMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? firstName = null,Object? lastName = null,Object? email = null,Object? avatarUrl = freezed,Object? role = null,Object? matriculationNumber = freezed,Object? coLecturer = null,Object? joinedAt = null,}) {
  return _then(_CourseMemberModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,matriculationNumber: freezed == matriculationNumber ? _self.matriculationNumber : matriculationNumber // ignore: cast_nullable_to_non_nullable
as String?,coLecturer: null == coLecturer ? _self.coLecturer : coLecturer // ignore: cast_nullable_to_non_nullable
as bool,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ScheduleModel {

 String get id;@JsonKey(name: 'course_id') String get courseId;@JsonKey(name: 'day_of_week') int get dayOfWeek;@JsonKey(name: 'start_time') String get startTime;@JsonKey(name: 'end_time') String get endTime; String get venue;
/// Create a copy of ScheduleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleModelCopyWith<ScheduleModel> get copyWith => _$ScheduleModelCopyWithImpl<ScheduleModel>(this as ScheduleModel, _$identity);

  /// Serializes this ScheduleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.venue, venue) || other.venue == venue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseId,dayOfWeek,startTime,endTime,venue);

@override
String toString() {
  return 'ScheduleModel(id: $id, courseId: $courseId, dayOfWeek: $dayOfWeek, startTime: $startTime, endTime: $endTime, venue: $venue)';
}


}

/// @nodoc
abstract mixin class $ScheduleModelCopyWith<$Res>  {
  factory $ScheduleModelCopyWith(ScheduleModel value, $Res Function(ScheduleModel) _then) = _$ScheduleModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'course_id') String courseId,@JsonKey(name: 'day_of_week') int dayOfWeek,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime, String venue
});




}
/// @nodoc
class _$ScheduleModelCopyWithImpl<$Res>
    implements $ScheduleModelCopyWith<$Res> {
  _$ScheduleModelCopyWithImpl(this._self, this._then);

  final ScheduleModel _self;
  final $Res Function(ScheduleModel) _then;

/// Create a copy of ScheduleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? courseId = null,Object? dayOfWeek = null,Object? startTime = null,Object? endTime = null,Object? venue = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleModel].
extension ScheduleModelPatterns on ScheduleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleModel value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleModel value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'course_id')  String courseId, @JsonKey(name: 'day_of_week')  int dayOfWeek, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime,  String venue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleModel() when $default != null:
return $default(_that.id,_that.courseId,_that.dayOfWeek,_that.startTime,_that.endTime,_that.venue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'course_id')  String courseId, @JsonKey(name: 'day_of_week')  int dayOfWeek, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime,  String venue)  $default,) {final _that = this;
switch (_that) {
case _ScheduleModel():
return $default(_that.id,_that.courseId,_that.dayOfWeek,_that.startTime,_that.endTime,_that.venue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'course_id')  String courseId, @JsonKey(name: 'day_of_week')  int dayOfWeek, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime,  String venue)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleModel() when $default != null:
return $default(_that.id,_that.courseId,_that.dayOfWeek,_that.startTime,_that.endTime,_that.venue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScheduleModel implements ScheduleModel {
  const _ScheduleModel({required this.id, @JsonKey(name: 'course_id') required this.courseId, @JsonKey(name: 'day_of_week') required this.dayOfWeek, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, required this.venue});
  factory _ScheduleModel.fromJson(Map<String, dynamic> json) => _$ScheduleModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'course_id') final  String courseId;
@override@JsonKey(name: 'day_of_week') final  int dayOfWeek;
@override@JsonKey(name: 'start_time') final  String startTime;
@override@JsonKey(name: 'end_time') final  String endTime;
@override final  String venue;

/// Create a copy of ScheduleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleModelCopyWith<_ScheduleModel> get copyWith => __$ScheduleModelCopyWithImpl<_ScheduleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScheduleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.venue, venue) || other.venue == venue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseId,dayOfWeek,startTime,endTime,venue);

@override
String toString() {
  return 'ScheduleModel(id: $id, courseId: $courseId, dayOfWeek: $dayOfWeek, startTime: $startTime, endTime: $endTime, venue: $venue)';
}


}

/// @nodoc
abstract mixin class _$ScheduleModelCopyWith<$Res> implements $ScheduleModelCopyWith<$Res> {
  factory _$ScheduleModelCopyWith(_ScheduleModel value, $Res Function(_ScheduleModel) _then) = __$ScheduleModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'course_id') String courseId,@JsonKey(name: 'day_of_week') int dayOfWeek,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime, String venue
});




}
/// @nodoc
class __$ScheduleModelCopyWithImpl<$Res>
    implements _$ScheduleModelCopyWith<$Res> {
  __$ScheduleModelCopyWithImpl(this._self, this._then);

  final _ScheduleModel _self;
  final $Res Function(_ScheduleModel) _then;

/// Create a copy of ScheduleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? courseId = null,Object? dayOfWeek = null,Object? startTime = null,Object? endTime = null,Object? venue = null,}) {
  return _then(_ScheduleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
