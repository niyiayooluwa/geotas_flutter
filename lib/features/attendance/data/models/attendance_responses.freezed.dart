// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceResponse {

 String get id;@JsonKey(name: 'session_id') String get sessionId;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'marked_at') String get markedAt; String get method;@JsonKey(name: 'week_number') int get weekNumber;
/// Create a copy of AttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceResponseCopyWith<AttendanceResponse> get copyWith => _$AttendanceResponseCopyWithImpl<AttendanceResponse>(this as AttendanceResponse, _$identity);

  /// Serializes this AttendanceResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.markedAt, markedAt) || other.markedAt == markedAt)&&(identical(other.method, method) || other.method == method)&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,userId,markedAt,method,weekNumber);

@override
String toString() {
  return 'AttendanceResponse(id: $id, sessionId: $sessionId, userId: $userId, markedAt: $markedAt, method: $method, weekNumber: $weekNumber)';
}


}

/// @nodoc
abstract mixin class $AttendanceResponseCopyWith<$Res>  {
  factory $AttendanceResponseCopyWith(AttendanceResponse value, $Res Function(AttendanceResponse) _then) = _$AttendanceResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'session_id') String sessionId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'marked_at') String markedAt, String method,@JsonKey(name: 'week_number') int weekNumber
});




}
/// @nodoc
class _$AttendanceResponseCopyWithImpl<$Res>
    implements $AttendanceResponseCopyWith<$Res> {
  _$AttendanceResponseCopyWithImpl(this._self, this._then);

  final AttendanceResponse _self;
  final $Res Function(AttendanceResponse) _then;

/// Create a copy of AttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sessionId = null,Object? userId = null,Object? markedAt = null,Object? method = null,Object? weekNumber = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,markedAt: null == markedAt ? _self.markedAt : markedAt // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceResponse].
extension AttendanceResponsePatterns on AttendanceResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceResponse value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'marked_at')  String markedAt,  String method, @JsonKey(name: 'week_number')  int weekNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceResponse() when $default != null:
return $default(_that.id,_that.sessionId,_that.userId,_that.markedAt,_that.method,_that.weekNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'marked_at')  String markedAt,  String method, @JsonKey(name: 'week_number')  int weekNumber)  $default,) {final _that = this;
switch (_that) {
case _AttendanceResponse():
return $default(_that.id,_that.sessionId,_that.userId,_that.markedAt,_that.method,_that.weekNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'marked_at')  String markedAt,  String method, @JsonKey(name: 'week_number')  int weekNumber)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceResponse() when $default != null:
return $default(_that.id,_that.sessionId,_that.userId,_that.markedAt,_that.method,_that.weekNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceResponse implements AttendanceResponse {
  const _AttendanceResponse({required this.id, @JsonKey(name: 'session_id') required this.sessionId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'marked_at') required this.markedAt, required this.method, @JsonKey(name: 'week_number') required this.weekNumber});
  factory _AttendanceResponse.fromJson(Map<String, dynamic> json) => _$AttendanceResponseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'session_id') final  String sessionId;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'marked_at') final  String markedAt;
@override final  String method;
@override@JsonKey(name: 'week_number') final  int weekNumber;

/// Create a copy of AttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceResponseCopyWith<_AttendanceResponse> get copyWith => __$AttendanceResponseCopyWithImpl<_AttendanceResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.markedAt, markedAt) || other.markedAt == markedAt)&&(identical(other.method, method) || other.method == method)&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,userId,markedAt,method,weekNumber);

@override
String toString() {
  return 'AttendanceResponse(id: $id, sessionId: $sessionId, userId: $userId, markedAt: $markedAt, method: $method, weekNumber: $weekNumber)';
}


}

/// @nodoc
abstract mixin class _$AttendanceResponseCopyWith<$Res> implements $AttendanceResponseCopyWith<$Res> {
  factory _$AttendanceResponseCopyWith(_AttendanceResponse value, $Res Function(_AttendanceResponse) _then) = __$AttendanceResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'session_id') String sessionId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'marked_at') String markedAt, String method,@JsonKey(name: 'week_number') int weekNumber
});




}
/// @nodoc
class __$AttendanceResponseCopyWithImpl<$Res>
    implements _$AttendanceResponseCopyWith<$Res> {
  __$AttendanceResponseCopyWithImpl(this._self, this._then);

  final _AttendanceResponse _self;
  final $Res Function(_AttendanceResponse) _then;

/// Create a copy of AttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sessionId = null,Object? userId = null,Object? markedAt = null,Object? method = null,Object? weekNumber = null,}) {
  return _then(_AttendanceResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,markedAt: null == markedAt ? _self.markedAt : markedAt // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DetailedAttendanceModel {

 String get id;@JsonKey(name: 'session_id') String get sessionId;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'marked_at') String get markedAt; String get method; double get latitude; double get longitude;@JsonKey(name: 'distance_from_center') double get distanceFromCenter;@JsonKey(name: 'mock_location_detected') bool get mockLocationDetected;@JsonKey(name: 'confidence_score') double get confidenceScore;@JsonKey(name: 'week_number') int get weekNumber;@JsonKey(name: 'device_id') String get deviceId;@JsonKey(name: 'device_model') String get deviceModel;@JsonKey(name: 'os_version') String get osVersion;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName;@JsonKey(name: 'matriculation_number') String get matriculationNumber; String get department;
/// Create a copy of DetailedAttendanceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailedAttendanceModelCopyWith<DetailedAttendanceModel> get copyWith => _$DetailedAttendanceModelCopyWithImpl<DetailedAttendanceModel>(this as DetailedAttendanceModel, _$identity);

  /// Serializes this DetailedAttendanceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailedAttendanceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.markedAt, markedAt) || other.markedAt == markedAt)&&(identical(other.method, method) || other.method == method)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceFromCenter, distanceFromCenter) || other.distanceFromCenter == distanceFromCenter)&&(identical(other.mockLocationDetected, mockLocationDetected) || other.mockLocationDetected == mockLocationDetected)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore)&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.matriculationNumber, matriculationNumber) || other.matriculationNumber == matriculationNumber)&&(identical(other.department, department) || other.department == department));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,userId,markedAt,method,latitude,longitude,distanceFromCenter,mockLocationDetected,confidenceScore,weekNumber,deviceId,deviceModel,osVersion,firstName,lastName,matriculationNumber,department);

@override
String toString() {
  return 'DetailedAttendanceModel(id: $id, sessionId: $sessionId, userId: $userId, markedAt: $markedAt, method: $method, latitude: $latitude, longitude: $longitude, distanceFromCenter: $distanceFromCenter, mockLocationDetected: $mockLocationDetected, confidenceScore: $confidenceScore, weekNumber: $weekNumber, deviceId: $deviceId, deviceModel: $deviceModel, osVersion: $osVersion, firstName: $firstName, lastName: $lastName, matriculationNumber: $matriculationNumber, department: $department)';
}


}

/// @nodoc
abstract mixin class $DetailedAttendanceModelCopyWith<$Res>  {
  factory $DetailedAttendanceModelCopyWith(DetailedAttendanceModel value, $Res Function(DetailedAttendanceModel) _then) = _$DetailedAttendanceModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'session_id') String sessionId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'marked_at') String markedAt, String method, double latitude, double longitude,@JsonKey(name: 'distance_from_center') double distanceFromCenter,@JsonKey(name: 'mock_location_detected') bool mockLocationDetected,@JsonKey(name: 'confidence_score') double confidenceScore,@JsonKey(name: 'week_number') int weekNumber,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'device_model') String deviceModel,@JsonKey(name: 'os_version') String osVersion,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'matriculation_number') String matriculationNumber, String department
});




}
/// @nodoc
class _$DetailedAttendanceModelCopyWithImpl<$Res>
    implements $DetailedAttendanceModelCopyWith<$Res> {
  _$DetailedAttendanceModelCopyWithImpl(this._self, this._then);

  final DetailedAttendanceModel _self;
  final $Res Function(DetailedAttendanceModel) _then;

/// Create a copy of DetailedAttendanceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sessionId = null,Object? userId = null,Object? markedAt = null,Object? method = null,Object? latitude = null,Object? longitude = null,Object? distanceFromCenter = null,Object? mockLocationDetected = null,Object? confidenceScore = null,Object? weekNumber = null,Object? deviceId = null,Object? deviceModel = null,Object? osVersion = null,Object? firstName = null,Object? lastName = null,Object? matriculationNumber = null,Object? department = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,markedAt: null == markedAt ? _self.markedAt : markedAt // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,distanceFromCenter: null == distanceFromCenter ? _self.distanceFromCenter : distanceFromCenter // ignore: cast_nullable_to_non_nullable
as double,mockLocationDetected: null == mockLocationDetected ? _self.mockLocationDetected : mockLocationDetected // ignore: cast_nullable_to_non_nullable
as bool,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double,weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,deviceModel: null == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String,osVersion: null == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,matriculationNumber: null == matriculationNumber ? _self.matriculationNumber : matriculationNumber // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailedAttendanceModel].
extension DetailedAttendanceModelPatterns on DetailedAttendanceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailedAttendanceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailedAttendanceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailedAttendanceModel value)  $default,){
final _that = this;
switch (_that) {
case _DetailedAttendanceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailedAttendanceModel value)?  $default,){
final _that = this;
switch (_that) {
case _DetailedAttendanceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'marked_at')  String markedAt,  String method,  double latitude,  double longitude, @JsonKey(name: 'distance_from_center')  double distanceFromCenter, @JsonKey(name: 'mock_location_detected')  bool mockLocationDetected, @JsonKey(name: 'confidence_score')  double confidenceScore, @JsonKey(name: 'week_number')  int weekNumber, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'device_model')  String deviceModel, @JsonKey(name: 'os_version')  String osVersion, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'matriculation_number')  String matriculationNumber,  String department)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailedAttendanceModel() when $default != null:
return $default(_that.id,_that.sessionId,_that.userId,_that.markedAt,_that.method,_that.latitude,_that.longitude,_that.distanceFromCenter,_that.mockLocationDetected,_that.confidenceScore,_that.weekNumber,_that.deviceId,_that.deviceModel,_that.osVersion,_that.firstName,_that.lastName,_that.matriculationNumber,_that.department);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'marked_at')  String markedAt,  String method,  double latitude,  double longitude, @JsonKey(name: 'distance_from_center')  double distanceFromCenter, @JsonKey(name: 'mock_location_detected')  bool mockLocationDetected, @JsonKey(name: 'confidence_score')  double confidenceScore, @JsonKey(name: 'week_number')  int weekNumber, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'device_model')  String deviceModel, @JsonKey(name: 'os_version')  String osVersion, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'matriculation_number')  String matriculationNumber,  String department)  $default,) {final _that = this;
switch (_that) {
case _DetailedAttendanceModel():
return $default(_that.id,_that.sessionId,_that.userId,_that.markedAt,_that.method,_that.latitude,_that.longitude,_that.distanceFromCenter,_that.mockLocationDetected,_that.confidenceScore,_that.weekNumber,_that.deviceId,_that.deviceModel,_that.osVersion,_that.firstName,_that.lastName,_that.matriculationNumber,_that.department);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'marked_at')  String markedAt,  String method,  double latitude,  double longitude, @JsonKey(name: 'distance_from_center')  double distanceFromCenter, @JsonKey(name: 'mock_location_detected')  bool mockLocationDetected, @JsonKey(name: 'confidence_score')  double confidenceScore, @JsonKey(name: 'week_number')  int weekNumber, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'device_model')  String deviceModel, @JsonKey(name: 'os_version')  String osVersion, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'matriculation_number')  String matriculationNumber,  String department)?  $default,) {final _that = this;
switch (_that) {
case _DetailedAttendanceModel() when $default != null:
return $default(_that.id,_that.sessionId,_that.userId,_that.markedAt,_that.method,_that.latitude,_that.longitude,_that.distanceFromCenter,_that.mockLocationDetected,_that.confidenceScore,_that.weekNumber,_that.deviceId,_that.deviceModel,_that.osVersion,_that.firstName,_that.lastName,_that.matriculationNumber,_that.department);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailedAttendanceModel implements DetailedAttendanceModel {
  const _DetailedAttendanceModel({required this.id, @JsonKey(name: 'session_id') required this.sessionId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'marked_at') required this.markedAt, required this.method, required this.latitude, required this.longitude, @JsonKey(name: 'distance_from_center') required this.distanceFromCenter, @JsonKey(name: 'mock_location_detected') required this.mockLocationDetected, @JsonKey(name: 'confidence_score') required this.confidenceScore, @JsonKey(name: 'week_number') required this.weekNumber, @JsonKey(name: 'device_id') required this.deviceId, @JsonKey(name: 'device_model') required this.deviceModel, @JsonKey(name: 'os_version') required this.osVersion, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, @JsonKey(name: 'matriculation_number') required this.matriculationNumber, required this.department});
  factory _DetailedAttendanceModel.fromJson(Map<String, dynamic> json) => _$DetailedAttendanceModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'session_id') final  String sessionId;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'marked_at') final  String markedAt;
@override final  String method;
@override final  double latitude;
@override final  double longitude;
@override@JsonKey(name: 'distance_from_center') final  double distanceFromCenter;
@override@JsonKey(name: 'mock_location_detected') final  bool mockLocationDetected;
@override@JsonKey(name: 'confidence_score') final  double confidenceScore;
@override@JsonKey(name: 'week_number') final  int weekNumber;
@override@JsonKey(name: 'device_id') final  String deviceId;
@override@JsonKey(name: 'device_model') final  String deviceModel;
@override@JsonKey(name: 'os_version') final  String osVersion;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override@JsonKey(name: 'matriculation_number') final  String matriculationNumber;
@override final  String department;

/// Create a copy of DetailedAttendanceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailedAttendanceModelCopyWith<_DetailedAttendanceModel> get copyWith => __$DetailedAttendanceModelCopyWithImpl<_DetailedAttendanceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailedAttendanceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailedAttendanceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.markedAt, markedAt) || other.markedAt == markedAt)&&(identical(other.method, method) || other.method == method)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceFromCenter, distanceFromCenter) || other.distanceFromCenter == distanceFromCenter)&&(identical(other.mockLocationDetected, mockLocationDetected) || other.mockLocationDetected == mockLocationDetected)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore)&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.matriculationNumber, matriculationNumber) || other.matriculationNumber == matriculationNumber)&&(identical(other.department, department) || other.department == department));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,userId,markedAt,method,latitude,longitude,distanceFromCenter,mockLocationDetected,confidenceScore,weekNumber,deviceId,deviceModel,osVersion,firstName,lastName,matriculationNumber,department);

@override
String toString() {
  return 'DetailedAttendanceModel(id: $id, sessionId: $sessionId, userId: $userId, markedAt: $markedAt, method: $method, latitude: $latitude, longitude: $longitude, distanceFromCenter: $distanceFromCenter, mockLocationDetected: $mockLocationDetected, confidenceScore: $confidenceScore, weekNumber: $weekNumber, deviceId: $deviceId, deviceModel: $deviceModel, osVersion: $osVersion, firstName: $firstName, lastName: $lastName, matriculationNumber: $matriculationNumber, department: $department)';
}


}

/// @nodoc
abstract mixin class _$DetailedAttendanceModelCopyWith<$Res> implements $DetailedAttendanceModelCopyWith<$Res> {
  factory _$DetailedAttendanceModelCopyWith(_DetailedAttendanceModel value, $Res Function(_DetailedAttendanceModel) _then) = __$DetailedAttendanceModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'session_id') String sessionId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'marked_at') String markedAt, String method, double latitude, double longitude,@JsonKey(name: 'distance_from_center') double distanceFromCenter,@JsonKey(name: 'mock_location_detected') bool mockLocationDetected,@JsonKey(name: 'confidence_score') double confidenceScore,@JsonKey(name: 'week_number') int weekNumber,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'device_model') String deviceModel,@JsonKey(name: 'os_version') String osVersion,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'matriculation_number') String matriculationNumber, String department
});




}
/// @nodoc
class __$DetailedAttendanceModelCopyWithImpl<$Res>
    implements _$DetailedAttendanceModelCopyWith<$Res> {
  __$DetailedAttendanceModelCopyWithImpl(this._self, this._then);

  final _DetailedAttendanceModel _self;
  final $Res Function(_DetailedAttendanceModel) _then;

/// Create a copy of DetailedAttendanceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sessionId = null,Object? userId = null,Object? markedAt = null,Object? method = null,Object? latitude = null,Object? longitude = null,Object? distanceFromCenter = null,Object? mockLocationDetected = null,Object? confidenceScore = null,Object? weekNumber = null,Object? deviceId = null,Object? deviceModel = null,Object? osVersion = null,Object? firstName = null,Object? lastName = null,Object? matriculationNumber = null,Object? department = null,}) {
  return _then(_DetailedAttendanceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,markedAt: null == markedAt ? _self.markedAt : markedAt // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,distanceFromCenter: null == distanceFromCenter ? _self.distanceFromCenter : distanceFromCenter // ignore: cast_nullable_to_non_nullable
as double,mockLocationDetected: null == mockLocationDetected ? _self.mockLocationDetected : mockLocationDetected // ignore: cast_nullable_to_non_nullable
as bool,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double,weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,deviceModel: null == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String,osVersion: null == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,matriculationNumber: null == matriculationNumber ? _self.matriculationNumber : matriculationNumber // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OTPResponse {

@JsonKey(name: 'otp_code') String get otpCode;@JsonKey(name: 'expires_at') String get expiresAt;
/// Create a copy of OTPResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OTPResponseCopyWith<OTPResponse> get copyWith => _$OTPResponseCopyWithImpl<OTPResponse>(this as OTPResponse, _$identity);

  /// Serializes this OTPResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OTPResponse&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,otpCode,expiresAt);

@override
String toString() {
  return 'OTPResponse(otpCode: $otpCode, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $OTPResponseCopyWith<$Res>  {
  factory $OTPResponseCopyWith(OTPResponse value, $Res Function(OTPResponse) _then) = _$OTPResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'otp_code') String otpCode,@JsonKey(name: 'expires_at') String expiresAt
});




}
/// @nodoc
class _$OTPResponseCopyWithImpl<$Res>
    implements $OTPResponseCopyWith<$Res> {
  _$OTPResponseCopyWithImpl(this._self, this._then);

  final OTPResponse _self;
  final $Res Function(OTPResponse) _then;

/// Create a copy of OTPResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? otpCode = null,Object? expiresAt = null,}) {
  return _then(_self.copyWith(
otpCode: null == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OTPResponse].
extension OTPResponsePatterns on OTPResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OTPResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OTPResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OTPResponse value)  $default,){
final _that = this;
switch (_that) {
case _OTPResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OTPResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OTPResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'otp_code')  String otpCode, @JsonKey(name: 'expires_at')  String expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OTPResponse() when $default != null:
return $default(_that.otpCode,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'otp_code')  String otpCode, @JsonKey(name: 'expires_at')  String expiresAt)  $default,) {final _that = this;
switch (_that) {
case _OTPResponse():
return $default(_that.otpCode,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'otp_code')  String otpCode, @JsonKey(name: 'expires_at')  String expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _OTPResponse() when $default != null:
return $default(_that.otpCode,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OTPResponse implements OTPResponse {
  const _OTPResponse({@JsonKey(name: 'otp_code') required this.otpCode, @JsonKey(name: 'expires_at') required this.expiresAt});
  factory _OTPResponse.fromJson(Map<String, dynamic> json) => _$OTPResponseFromJson(json);

@override@JsonKey(name: 'otp_code') final  String otpCode;
@override@JsonKey(name: 'expires_at') final  String expiresAt;

/// Create a copy of OTPResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OTPResponseCopyWith<_OTPResponse> get copyWith => __$OTPResponseCopyWithImpl<_OTPResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OTPResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OTPResponse&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,otpCode,expiresAt);

@override
String toString() {
  return 'OTPResponse(otpCode: $otpCode, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$OTPResponseCopyWith<$Res> implements $OTPResponseCopyWith<$Res> {
  factory _$OTPResponseCopyWith(_OTPResponse value, $Res Function(_OTPResponse) _then) = __$OTPResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'otp_code') String otpCode,@JsonKey(name: 'expires_at') String expiresAt
});




}
/// @nodoc
class __$OTPResponseCopyWithImpl<$Res>
    implements _$OTPResponseCopyWith<$Res> {
  __$OTPResponseCopyWithImpl(this._self, this._then);

  final _OTPResponse _self;
  final $Res Function(_OTPResponse) _then;

/// Create a copy of OTPResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otpCode = null,Object? expiresAt = null,}) {
  return _then(_OTPResponse(
otpCode: null == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
