// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionModel {

 String get id;@JsonKey(name: 'course_id') String get courseId;@JsonKey(name: 'created_by') String get createdBy; String get title;@JsonKey(name: 'week_number') int get weekNumber; double get latitude; double get longitude;@JsonKey(name: 'radius_meters') double get radiusMeters;@JsonKey(name: 'qr_rotation_secs') int get qrRotationSecs; String get status;@JsonKey(name: 'started_at') String get startedAt;@JsonKey(name: 'closed_at') String? get closedAt;
/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionModelCopyWith<SessionModel> get copyWith => _$SessionModelCopyWithImpl<SessionModel>(this as SessionModel, _$identity);

  /// Serializes this SessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.title, title) || other.title == title)&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.radiusMeters, radiusMeters) || other.radiusMeters == radiusMeters)&&(identical(other.qrRotationSecs, qrRotationSecs) || other.qrRotationSecs == qrRotationSecs)&&(identical(other.status, status) || other.status == status)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseId,createdBy,title,weekNumber,latitude,longitude,radiusMeters,qrRotationSecs,status,startedAt,closedAt);

@override
String toString() {
  return 'SessionModel(id: $id, courseId: $courseId, createdBy: $createdBy, title: $title, weekNumber: $weekNumber, latitude: $latitude, longitude: $longitude, radiusMeters: $radiusMeters, qrRotationSecs: $qrRotationSecs, status: $status, startedAt: $startedAt, closedAt: $closedAt)';
}


}

/// @nodoc
abstract mixin class $SessionModelCopyWith<$Res>  {
  factory $SessionModelCopyWith(SessionModel value, $Res Function(SessionModel) _then) = _$SessionModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'course_id') String courseId,@JsonKey(name: 'created_by') String createdBy, String title,@JsonKey(name: 'week_number') int weekNumber, double latitude, double longitude,@JsonKey(name: 'radius_meters') double radiusMeters,@JsonKey(name: 'qr_rotation_secs') int qrRotationSecs, String status,@JsonKey(name: 'started_at') String startedAt,@JsonKey(name: 'closed_at') String? closedAt
});




}
/// @nodoc
class _$SessionModelCopyWithImpl<$Res>
    implements $SessionModelCopyWith<$Res> {
  _$SessionModelCopyWithImpl(this._self, this._then);

  final SessionModel _self;
  final $Res Function(SessionModel) _then;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? courseId = null,Object? createdBy = null,Object? title = null,Object? weekNumber = null,Object? latitude = null,Object? longitude = null,Object? radiusMeters = null,Object? qrRotationSecs = null,Object? status = null,Object? startedAt = null,Object? closedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,radiusMeters: null == radiusMeters ? _self.radiusMeters : radiusMeters // ignore: cast_nullable_to_non_nullable
as double,qrRotationSecs: null == qrRotationSecs ? _self.qrRotationSecs : qrRotationSecs // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as String,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionModel].
extension SessionModelPatterns on SessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'course_id')  String courseId, @JsonKey(name: 'created_by')  String createdBy,  String title, @JsonKey(name: 'week_number')  int weekNumber,  double latitude,  double longitude, @JsonKey(name: 'radius_meters')  double radiusMeters, @JsonKey(name: 'qr_rotation_secs')  int qrRotationSecs,  String status, @JsonKey(name: 'started_at')  String startedAt, @JsonKey(name: 'closed_at')  String? closedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that.id,_that.courseId,_that.createdBy,_that.title,_that.weekNumber,_that.latitude,_that.longitude,_that.radiusMeters,_that.qrRotationSecs,_that.status,_that.startedAt,_that.closedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'course_id')  String courseId, @JsonKey(name: 'created_by')  String createdBy,  String title, @JsonKey(name: 'week_number')  int weekNumber,  double latitude,  double longitude, @JsonKey(name: 'radius_meters')  double radiusMeters, @JsonKey(name: 'qr_rotation_secs')  int qrRotationSecs,  String status, @JsonKey(name: 'started_at')  String startedAt, @JsonKey(name: 'closed_at')  String? closedAt)  $default,) {final _that = this;
switch (_that) {
case _SessionModel():
return $default(_that.id,_that.courseId,_that.createdBy,_that.title,_that.weekNumber,_that.latitude,_that.longitude,_that.radiusMeters,_that.qrRotationSecs,_that.status,_that.startedAt,_that.closedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'course_id')  String courseId, @JsonKey(name: 'created_by')  String createdBy,  String title, @JsonKey(name: 'week_number')  int weekNumber,  double latitude,  double longitude, @JsonKey(name: 'radius_meters')  double radiusMeters, @JsonKey(name: 'qr_rotation_secs')  int qrRotationSecs,  String status, @JsonKey(name: 'started_at')  String startedAt, @JsonKey(name: 'closed_at')  String? closedAt)?  $default,) {final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that.id,_that.courseId,_that.createdBy,_that.title,_that.weekNumber,_that.latitude,_that.longitude,_that.radiusMeters,_that.qrRotationSecs,_that.status,_that.startedAt,_that.closedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionModel implements SessionModel {
  const _SessionModel({required this.id, @JsonKey(name: 'course_id') required this.courseId, @JsonKey(name: 'created_by') required this.createdBy, required this.title, @JsonKey(name: 'week_number') required this.weekNumber, required this.latitude, required this.longitude, @JsonKey(name: 'radius_meters') required this.radiusMeters, @JsonKey(name: 'qr_rotation_secs') required this.qrRotationSecs, required this.status, @JsonKey(name: 'started_at') required this.startedAt, @JsonKey(name: 'closed_at') this.closedAt});
  factory _SessionModel.fromJson(Map<String, dynamic> json) => _$SessionModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'course_id') final  String courseId;
@override@JsonKey(name: 'created_by') final  String createdBy;
@override final  String title;
@override@JsonKey(name: 'week_number') final  int weekNumber;
@override final  double latitude;
@override final  double longitude;
@override@JsonKey(name: 'radius_meters') final  double radiusMeters;
@override@JsonKey(name: 'qr_rotation_secs') final  int qrRotationSecs;
@override final  String status;
@override@JsonKey(name: 'started_at') final  String startedAt;
@override@JsonKey(name: 'closed_at') final  String? closedAt;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionModelCopyWith<_SessionModel> get copyWith => __$SessionModelCopyWithImpl<_SessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.title, title) || other.title == title)&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.radiusMeters, radiusMeters) || other.radiusMeters == radiusMeters)&&(identical(other.qrRotationSecs, qrRotationSecs) || other.qrRotationSecs == qrRotationSecs)&&(identical(other.status, status) || other.status == status)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseId,createdBy,title,weekNumber,latitude,longitude,radiusMeters,qrRotationSecs,status,startedAt,closedAt);

@override
String toString() {
  return 'SessionModel(id: $id, courseId: $courseId, createdBy: $createdBy, title: $title, weekNumber: $weekNumber, latitude: $latitude, longitude: $longitude, radiusMeters: $radiusMeters, qrRotationSecs: $qrRotationSecs, status: $status, startedAt: $startedAt, closedAt: $closedAt)';
}


}

/// @nodoc
abstract mixin class _$SessionModelCopyWith<$Res> implements $SessionModelCopyWith<$Res> {
  factory _$SessionModelCopyWith(_SessionModel value, $Res Function(_SessionModel) _then) = __$SessionModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'course_id') String courseId,@JsonKey(name: 'created_by') String createdBy, String title,@JsonKey(name: 'week_number') int weekNumber, double latitude, double longitude,@JsonKey(name: 'radius_meters') double radiusMeters,@JsonKey(name: 'qr_rotation_secs') int qrRotationSecs, String status,@JsonKey(name: 'started_at') String startedAt,@JsonKey(name: 'closed_at') String? closedAt
});




}
/// @nodoc
class __$SessionModelCopyWithImpl<$Res>
    implements _$SessionModelCopyWith<$Res> {
  __$SessionModelCopyWithImpl(this._self, this._then);

  final _SessionModel _self;
  final $Res Function(_SessionModel) _then;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? courseId = null,Object? createdBy = null,Object? title = null,Object? weekNumber = null,Object? latitude = null,Object? longitude = null,Object? radiusMeters = null,Object? qrRotationSecs = null,Object? status = null,Object? startedAt = null,Object? closedAt = freezed,}) {
  return _then(_SessionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,radiusMeters: null == radiusMeters ? _self.radiusMeters : radiusMeters // ignore: cast_nullable_to_non_nullable
as double,qrRotationSecs: null == qrRotationSecs ? _self.qrRotationSecs : qrRotationSecs // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as String,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateSessionRequest {

@JsonKey(name: 'course_id') String get courseId; String get title;@JsonKey(name: 'week_number') int get weekNumber; double get latitude; double get longitude;@JsonKey(name: 'radius_meters') double get radiusMeters;@JsonKey(name: 'qr_rotation_secs', defaultValue: 30) int? get qrRotationSecs;
/// Create a copy of CreateSessionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSessionRequestCopyWith<CreateSessionRequest> get copyWith => _$CreateSessionRequestCopyWithImpl<CreateSessionRequest>(this as CreateSessionRequest, _$identity);

  /// Serializes this CreateSessionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSessionRequest&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.title, title) || other.title == title)&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.radiusMeters, radiusMeters) || other.radiusMeters == radiusMeters)&&(identical(other.qrRotationSecs, qrRotationSecs) || other.qrRotationSecs == qrRotationSecs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,courseId,title,weekNumber,latitude,longitude,radiusMeters,qrRotationSecs);

@override
String toString() {
  return 'CreateSessionRequest(courseId: $courseId, title: $title, weekNumber: $weekNumber, latitude: $latitude, longitude: $longitude, radiusMeters: $radiusMeters, qrRotationSecs: $qrRotationSecs)';
}


}

/// @nodoc
abstract mixin class $CreateSessionRequestCopyWith<$Res>  {
  factory $CreateSessionRequestCopyWith(CreateSessionRequest value, $Res Function(CreateSessionRequest) _then) = _$CreateSessionRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'course_id') String courseId, String title,@JsonKey(name: 'week_number') int weekNumber, double latitude, double longitude,@JsonKey(name: 'radius_meters') double radiusMeters,@JsonKey(name: 'qr_rotation_secs', defaultValue: 30) int? qrRotationSecs
});




}
/// @nodoc
class _$CreateSessionRequestCopyWithImpl<$Res>
    implements $CreateSessionRequestCopyWith<$Res> {
  _$CreateSessionRequestCopyWithImpl(this._self, this._then);

  final CreateSessionRequest _self;
  final $Res Function(CreateSessionRequest) _then;

/// Create a copy of CreateSessionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? courseId = null,Object? title = null,Object? weekNumber = null,Object? latitude = null,Object? longitude = null,Object? radiusMeters = null,Object? qrRotationSecs = freezed,}) {
  return _then(_self.copyWith(
courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,radiusMeters: null == radiusMeters ? _self.radiusMeters : radiusMeters // ignore: cast_nullable_to_non_nullable
as double,qrRotationSecs: freezed == qrRotationSecs ? _self.qrRotationSecs : qrRotationSecs // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateSessionRequest].
extension CreateSessionRequestPatterns on CreateSessionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateSessionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSessionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateSessionRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateSessionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateSessionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateSessionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'course_id')  String courseId,  String title, @JsonKey(name: 'week_number')  int weekNumber,  double latitude,  double longitude, @JsonKey(name: 'radius_meters')  double radiusMeters, @JsonKey(name: 'qr_rotation_secs', defaultValue: 30)  int? qrRotationSecs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSessionRequest() when $default != null:
return $default(_that.courseId,_that.title,_that.weekNumber,_that.latitude,_that.longitude,_that.radiusMeters,_that.qrRotationSecs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'course_id')  String courseId,  String title, @JsonKey(name: 'week_number')  int weekNumber,  double latitude,  double longitude, @JsonKey(name: 'radius_meters')  double radiusMeters, @JsonKey(name: 'qr_rotation_secs', defaultValue: 30)  int? qrRotationSecs)  $default,) {final _that = this;
switch (_that) {
case _CreateSessionRequest():
return $default(_that.courseId,_that.title,_that.weekNumber,_that.latitude,_that.longitude,_that.radiusMeters,_that.qrRotationSecs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'course_id')  String courseId,  String title, @JsonKey(name: 'week_number')  int weekNumber,  double latitude,  double longitude, @JsonKey(name: 'radius_meters')  double radiusMeters, @JsonKey(name: 'qr_rotation_secs', defaultValue: 30)  int? qrRotationSecs)?  $default,) {final _that = this;
switch (_that) {
case _CreateSessionRequest() when $default != null:
return $default(_that.courseId,_that.title,_that.weekNumber,_that.latitude,_that.longitude,_that.radiusMeters,_that.qrRotationSecs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateSessionRequest implements CreateSessionRequest {
  const _CreateSessionRequest({@JsonKey(name: 'course_id') required this.courseId, required this.title, @JsonKey(name: 'week_number') required this.weekNumber, required this.latitude, required this.longitude, @JsonKey(name: 'radius_meters') required this.radiusMeters, @JsonKey(name: 'qr_rotation_secs', defaultValue: 30) this.qrRotationSecs});
  factory _CreateSessionRequest.fromJson(Map<String, dynamic> json) => _$CreateSessionRequestFromJson(json);

@override@JsonKey(name: 'course_id') final  String courseId;
@override final  String title;
@override@JsonKey(name: 'week_number') final  int weekNumber;
@override final  double latitude;
@override final  double longitude;
@override@JsonKey(name: 'radius_meters') final  double radiusMeters;
@override@JsonKey(name: 'qr_rotation_secs', defaultValue: 30) final  int? qrRotationSecs;

/// Create a copy of CreateSessionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSessionRequestCopyWith<_CreateSessionRequest> get copyWith => __$CreateSessionRequestCopyWithImpl<_CreateSessionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateSessionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSessionRequest&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.title, title) || other.title == title)&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.radiusMeters, radiusMeters) || other.radiusMeters == radiusMeters)&&(identical(other.qrRotationSecs, qrRotationSecs) || other.qrRotationSecs == qrRotationSecs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,courseId,title,weekNumber,latitude,longitude,radiusMeters,qrRotationSecs);

@override
String toString() {
  return 'CreateSessionRequest(courseId: $courseId, title: $title, weekNumber: $weekNumber, latitude: $latitude, longitude: $longitude, radiusMeters: $radiusMeters, qrRotationSecs: $qrRotationSecs)';
}


}

/// @nodoc
abstract mixin class _$CreateSessionRequestCopyWith<$Res> implements $CreateSessionRequestCopyWith<$Res> {
  factory _$CreateSessionRequestCopyWith(_CreateSessionRequest value, $Res Function(_CreateSessionRequest) _then) = __$CreateSessionRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'course_id') String courseId, String title,@JsonKey(name: 'week_number') int weekNumber, double latitude, double longitude,@JsonKey(name: 'radius_meters') double radiusMeters,@JsonKey(name: 'qr_rotation_secs', defaultValue: 30) int? qrRotationSecs
});




}
/// @nodoc
class __$CreateSessionRequestCopyWithImpl<$Res>
    implements _$CreateSessionRequestCopyWith<$Res> {
  __$CreateSessionRequestCopyWithImpl(this._self, this._then);

  final _CreateSessionRequest _self;
  final $Res Function(_CreateSessionRequest) _then;

/// Create a copy of CreateSessionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? courseId = null,Object? title = null,Object? weekNumber = null,Object? latitude = null,Object? longitude = null,Object? radiusMeters = null,Object? qrRotationSecs = freezed,}) {
  return _then(_CreateSessionRequest(
courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,radiusMeters: null == radiusMeters ? _self.radiusMeters : radiusMeters // ignore: cast_nullable_to_non_nullable
as double,qrRotationSecs: freezed == qrRotationSecs ? _self.qrRotationSecs : qrRotationSecs // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$QRTokenResponse {

 String get token;
/// Create a copy of QRTokenResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QRTokenResponseCopyWith<QRTokenResponse> get copyWith => _$QRTokenResponseCopyWithImpl<QRTokenResponse>(this as QRTokenResponse, _$identity);

  /// Serializes this QRTokenResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QRTokenResponse&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'QRTokenResponse(token: $token)';
}


}

/// @nodoc
abstract mixin class $QRTokenResponseCopyWith<$Res>  {
  factory $QRTokenResponseCopyWith(QRTokenResponse value, $Res Function(QRTokenResponse) _then) = _$QRTokenResponseCopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class _$QRTokenResponseCopyWithImpl<$Res>
    implements $QRTokenResponseCopyWith<$Res> {
  _$QRTokenResponseCopyWithImpl(this._self, this._then);

  final QRTokenResponse _self;
  final $Res Function(QRTokenResponse) _then;

/// Create a copy of QRTokenResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QRTokenResponse].
extension QRTokenResponsePatterns on QRTokenResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QRTokenResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QRTokenResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QRTokenResponse value)  $default,){
final _that = this;
switch (_that) {
case _QRTokenResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QRTokenResponse value)?  $default,){
final _that = this;
switch (_that) {
case _QRTokenResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QRTokenResponse() when $default != null:
return $default(_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token)  $default,) {final _that = this;
switch (_that) {
case _QRTokenResponse():
return $default(_that.token);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token)?  $default,) {final _that = this;
switch (_that) {
case _QRTokenResponse() when $default != null:
return $default(_that.token);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QRTokenResponse implements QRTokenResponse {
  const _QRTokenResponse({required this.token});
  factory _QRTokenResponse.fromJson(Map<String, dynamic> json) => _$QRTokenResponseFromJson(json);

@override final  String token;

/// Create a copy of QRTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QRTokenResponseCopyWith<_QRTokenResponse> get copyWith => __$QRTokenResponseCopyWithImpl<_QRTokenResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QRTokenResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QRTokenResponse&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'QRTokenResponse(token: $token)';
}


}

/// @nodoc
abstract mixin class _$QRTokenResponseCopyWith<$Res> implements $QRTokenResponseCopyWith<$Res> {
  factory _$QRTokenResponseCopyWith(_QRTokenResponse value, $Res Function(_QRTokenResponse) _then) = __$QRTokenResponseCopyWithImpl;
@override @useResult
$Res call({
 String token
});




}
/// @nodoc
class __$QRTokenResponseCopyWithImpl<$Res>
    implements _$QRTokenResponseCopyWith<$Res> {
  __$QRTokenResponseCopyWithImpl(this._self, this._then);

  final _QRTokenResponse _self;
  final $Res Function(_QRTokenResponse) _then;

/// Create a copy of QRTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(_QRTokenResponse(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
