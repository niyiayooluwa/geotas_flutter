// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarkAttendanceQRRequest {

@JsonKey(name: 'session_id') String get sessionId;@JsonKey(name: 'qr_token') String get qrToken; double get latitude; double get longitude;@JsonKey(name: 'device_id') String get deviceId;@JsonKey(name: 'device_model') String get deviceModel;@JsonKey(name: 'os_version') String get osVersion;@JsonKey(name: 'mock_location_detected') bool get mockLocationDetected;
/// Create a copy of MarkAttendanceQRRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkAttendanceQRRequestCopyWith<MarkAttendanceQRRequest> get copyWith => _$MarkAttendanceQRRequestCopyWithImpl<MarkAttendanceQRRequest>(this as MarkAttendanceQRRequest, _$identity);

  /// Serializes this MarkAttendanceQRRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkAttendanceQRRequest&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.qrToken, qrToken) || other.qrToken == qrToken)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.mockLocationDetected, mockLocationDetected) || other.mockLocationDetected == mockLocationDetected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,qrToken,latitude,longitude,deviceId,deviceModel,osVersion,mockLocationDetected);

@override
String toString() {
  return 'MarkAttendanceQRRequest(sessionId: $sessionId, qrToken: $qrToken, latitude: $latitude, longitude: $longitude, deviceId: $deviceId, deviceModel: $deviceModel, osVersion: $osVersion, mockLocationDetected: $mockLocationDetected)';
}


}

/// @nodoc
abstract mixin class $MarkAttendanceQRRequestCopyWith<$Res>  {
  factory $MarkAttendanceQRRequestCopyWith(MarkAttendanceQRRequest value, $Res Function(MarkAttendanceQRRequest) _then) = _$MarkAttendanceQRRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'session_id') String sessionId,@JsonKey(name: 'qr_token') String qrToken, double latitude, double longitude,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'device_model') String deviceModel,@JsonKey(name: 'os_version') String osVersion,@JsonKey(name: 'mock_location_detected') bool mockLocationDetected
});




}
/// @nodoc
class _$MarkAttendanceQRRequestCopyWithImpl<$Res>
    implements $MarkAttendanceQRRequestCopyWith<$Res> {
  _$MarkAttendanceQRRequestCopyWithImpl(this._self, this._then);

  final MarkAttendanceQRRequest _self;
  final $Res Function(MarkAttendanceQRRequest) _then;

/// Create a copy of MarkAttendanceQRRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? qrToken = null,Object? latitude = null,Object? longitude = null,Object? deviceId = null,Object? deviceModel = null,Object? osVersion = null,Object? mockLocationDetected = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,qrToken: null == qrToken ? _self.qrToken : qrToken // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,deviceModel: null == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String,osVersion: null == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String,mockLocationDetected: null == mockLocationDetected ? _self.mockLocationDetected : mockLocationDetected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MarkAttendanceQRRequest].
extension MarkAttendanceQRRequestPatterns on MarkAttendanceQRRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarkAttendanceQRRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarkAttendanceQRRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarkAttendanceQRRequest value)  $default,){
final _that = this;
switch (_that) {
case _MarkAttendanceQRRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarkAttendanceQRRequest value)?  $default,){
final _that = this;
switch (_that) {
case _MarkAttendanceQRRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'qr_token')  String qrToken,  double latitude,  double longitude, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'device_model')  String deviceModel, @JsonKey(name: 'os_version')  String osVersion, @JsonKey(name: 'mock_location_detected')  bool mockLocationDetected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarkAttendanceQRRequest() when $default != null:
return $default(_that.sessionId,_that.qrToken,_that.latitude,_that.longitude,_that.deviceId,_that.deviceModel,_that.osVersion,_that.mockLocationDetected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'qr_token')  String qrToken,  double latitude,  double longitude, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'device_model')  String deviceModel, @JsonKey(name: 'os_version')  String osVersion, @JsonKey(name: 'mock_location_detected')  bool mockLocationDetected)  $default,) {final _that = this;
switch (_that) {
case _MarkAttendanceQRRequest():
return $default(_that.sessionId,_that.qrToken,_that.latitude,_that.longitude,_that.deviceId,_that.deviceModel,_that.osVersion,_that.mockLocationDetected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'qr_token')  String qrToken,  double latitude,  double longitude, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'device_model')  String deviceModel, @JsonKey(name: 'os_version')  String osVersion, @JsonKey(name: 'mock_location_detected')  bool mockLocationDetected)?  $default,) {final _that = this;
switch (_that) {
case _MarkAttendanceQRRequest() when $default != null:
return $default(_that.sessionId,_that.qrToken,_that.latitude,_that.longitude,_that.deviceId,_that.deviceModel,_that.osVersion,_that.mockLocationDetected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarkAttendanceQRRequest implements MarkAttendanceQRRequest {
  const _MarkAttendanceQRRequest({@JsonKey(name: 'session_id') required this.sessionId, @JsonKey(name: 'qr_token') required this.qrToken, required this.latitude, required this.longitude, @JsonKey(name: 'device_id') required this.deviceId, @JsonKey(name: 'device_model') required this.deviceModel, @JsonKey(name: 'os_version') required this.osVersion, @JsonKey(name: 'mock_location_detected') required this.mockLocationDetected});
  factory _MarkAttendanceQRRequest.fromJson(Map<String, dynamic> json) => _$MarkAttendanceQRRequestFromJson(json);

@override@JsonKey(name: 'session_id') final  String sessionId;
@override@JsonKey(name: 'qr_token') final  String qrToken;
@override final  double latitude;
@override final  double longitude;
@override@JsonKey(name: 'device_id') final  String deviceId;
@override@JsonKey(name: 'device_model') final  String deviceModel;
@override@JsonKey(name: 'os_version') final  String osVersion;
@override@JsonKey(name: 'mock_location_detected') final  bool mockLocationDetected;

/// Create a copy of MarkAttendanceQRRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkAttendanceQRRequestCopyWith<_MarkAttendanceQRRequest> get copyWith => __$MarkAttendanceQRRequestCopyWithImpl<_MarkAttendanceQRRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarkAttendanceQRRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAttendanceQRRequest&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.qrToken, qrToken) || other.qrToken == qrToken)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.mockLocationDetected, mockLocationDetected) || other.mockLocationDetected == mockLocationDetected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,qrToken,latitude,longitude,deviceId,deviceModel,osVersion,mockLocationDetected);

@override
String toString() {
  return 'MarkAttendanceQRRequest(sessionId: $sessionId, qrToken: $qrToken, latitude: $latitude, longitude: $longitude, deviceId: $deviceId, deviceModel: $deviceModel, osVersion: $osVersion, mockLocationDetected: $mockLocationDetected)';
}


}

/// @nodoc
abstract mixin class _$MarkAttendanceQRRequestCopyWith<$Res> implements $MarkAttendanceQRRequestCopyWith<$Res> {
  factory _$MarkAttendanceQRRequestCopyWith(_MarkAttendanceQRRequest value, $Res Function(_MarkAttendanceQRRequest) _then) = __$MarkAttendanceQRRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'session_id') String sessionId,@JsonKey(name: 'qr_token') String qrToken, double latitude, double longitude,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'device_model') String deviceModel,@JsonKey(name: 'os_version') String osVersion,@JsonKey(name: 'mock_location_detected') bool mockLocationDetected
});




}
/// @nodoc
class __$MarkAttendanceQRRequestCopyWithImpl<$Res>
    implements _$MarkAttendanceQRRequestCopyWith<$Res> {
  __$MarkAttendanceQRRequestCopyWithImpl(this._self, this._then);

  final _MarkAttendanceQRRequest _self;
  final $Res Function(_MarkAttendanceQRRequest) _then;

/// Create a copy of MarkAttendanceQRRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? qrToken = null,Object? latitude = null,Object? longitude = null,Object? deviceId = null,Object? deviceModel = null,Object? osVersion = null,Object? mockLocationDetected = null,}) {
  return _then(_MarkAttendanceQRRequest(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,qrToken: null == qrToken ? _self.qrToken : qrToken // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,deviceModel: null == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String,osVersion: null == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String,mockLocationDetected: null == mockLocationDetected ? _self.mockLocationDetected : mockLocationDetected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$MarkAttendanceOTPRequest {

@JsonKey(name: 'session_id') String get sessionId;@JsonKey(name: 'otp_code') String get otpCode; double get latitude; double get longitude;@JsonKey(name: 'device_id') String get deviceId;@JsonKey(name: 'device_model') String get deviceModel;@JsonKey(name: 'os_version') String get osVersion;@JsonKey(name: 'mock_location_detected') bool get mockLocationDetected;
/// Create a copy of MarkAttendanceOTPRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkAttendanceOTPRequestCopyWith<MarkAttendanceOTPRequest> get copyWith => _$MarkAttendanceOTPRequestCopyWithImpl<MarkAttendanceOTPRequest>(this as MarkAttendanceOTPRequest, _$identity);

  /// Serializes this MarkAttendanceOTPRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkAttendanceOTPRequest&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.mockLocationDetected, mockLocationDetected) || other.mockLocationDetected == mockLocationDetected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,otpCode,latitude,longitude,deviceId,deviceModel,osVersion,mockLocationDetected);

@override
String toString() {
  return 'MarkAttendanceOTPRequest(sessionId: $sessionId, otpCode: $otpCode, latitude: $latitude, longitude: $longitude, deviceId: $deviceId, deviceModel: $deviceModel, osVersion: $osVersion, mockLocationDetected: $mockLocationDetected)';
}


}

/// @nodoc
abstract mixin class $MarkAttendanceOTPRequestCopyWith<$Res>  {
  factory $MarkAttendanceOTPRequestCopyWith(MarkAttendanceOTPRequest value, $Res Function(MarkAttendanceOTPRequest) _then) = _$MarkAttendanceOTPRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'session_id') String sessionId,@JsonKey(name: 'otp_code') String otpCode, double latitude, double longitude,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'device_model') String deviceModel,@JsonKey(name: 'os_version') String osVersion,@JsonKey(name: 'mock_location_detected') bool mockLocationDetected
});




}
/// @nodoc
class _$MarkAttendanceOTPRequestCopyWithImpl<$Res>
    implements $MarkAttendanceOTPRequestCopyWith<$Res> {
  _$MarkAttendanceOTPRequestCopyWithImpl(this._self, this._then);

  final MarkAttendanceOTPRequest _self;
  final $Res Function(MarkAttendanceOTPRequest) _then;

/// Create a copy of MarkAttendanceOTPRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? otpCode = null,Object? latitude = null,Object? longitude = null,Object? deviceId = null,Object? deviceModel = null,Object? osVersion = null,Object? mockLocationDetected = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,otpCode: null == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,deviceModel: null == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String,osVersion: null == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String,mockLocationDetected: null == mockLocationDetected ? _self.mockLocationDetected : mockLocationDetected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MarkAttendanceOTPRequest].
extension MarkAttendanceOTPRequestPatterns on MarkAttendanceOTPRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarkAttendanceOTPRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarkAttendanceOTPRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarkAttendanceOTPRequest value)  $default,){
final _that = this;
switch (_that) {
case _MarkAttendanceOTPRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarkAttendanceOTPRequest value)?  $default,){
final _that = this;
switch (_that) {
case _MarkAttendanceOTPRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'otp_code')  String otpCode,  double latitude,  double longitude, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'device_model')  String deviceModel, @JsonKey(name: 'os_version')  String osVersion, @JsonKey(name: 'mock_location_detected')  bool mockLocationDetected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarkAttendanceOTPRequest() when $default != null:
return $default(_that.sessionId,_that.otpCode,_that.latitude,_that.longitude,_that.deviceId,_that.deviceModel,_that.osVersion,_that.mockLocationDetected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'otp_code')  String otpCode,  double latitude,  double longitude, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'device_model')  String deviceModel, @JsonKey(name: 'os_version')  String osVersion, @JsonKey(name: 'mock_location_detected')  bool mockLocationDetected)  $default,) {final _that = this;
switch (_that) {
case _MarkAttendanceOTPRequest():
return $default(_that.sessionId,_that.otpCode,_that.latitude,_that.longitude,_that.deviceId,_that.deviceModel,_that.osVersion,_that.mockLocationDetected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'otp_code')  String otpCode,  double latitude,  double longitude, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'device_model')  String deviceModel, @JsonKey(name: 'os_version')  String osVersion, @JsonKey(name: 'mock_location_detected')  bool mockLocationDetected)?  $default,) {final _that = this;
switch (_that) {
case _MarkAttendanceOTPRequest() when $default != null:
return $default(_that.sessionId,_that.otpCode,_that.latitude,_that.longitude,_that.deviceId,_that.deviceModel,_that.osVersion,_that.mockLocationDetected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarkAttendanceOTPRequest implements MarkAttendanceOTPRequest {
  const _MarkAttendanceOTPRequest({@JsonKey(name: 'session_id') required this.sessionId, @JsonKey(name: 'otp_code') required this.otpCode, required this.latitude, required this.longitude, @JsonKey(name: 'device_id') required this.deviceId, @JsonKey(name: 'device_model') required this.deviceModel, @JsonKey(name: 'os_version') required this.osVersion, @JsonKey(name: 'mock_location_detected') required this.mockLocationDetected});
  factory _MarkAttendanceOTPRequest.fromJson(Map<String, dynamic> json) => _$MarkAttendanceOTPRequestFromJson(json);

@override@JsonKey(name: 'session_id') final  String sessionId;
@override@JsonKey(name: 'otp_code') final  String otpCode;
@override final  double latitude;
@override final  double longitude;
@override@JsonKey(name: 'device_id') final  String deviceId;
@override@JsonKey(name: 'device_model') final  String deviceModel;
@override@JsonKey(name: 'os_version') final  String osVersion;
@override@JsonKey(name: 'mock_location_detected') final  bool mockLocationDetected;

/// Create a copy of MarkAttendanceOTPRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkAttendanceOTPRequestCopyWith<_MarkAttendanceOTPRequest> get copyWith => __$MarkAttendanceOTPRequestCopyWithImpl<_MarkAttendanceOTPRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarkAttendanceOTPRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAttendanceOTPRequest&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.mockLocationDetected, mockLocationDetected) || other.mockLocationDetected == mockLocationDetected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,otpCode,latitude,longitude,deviceId,deviceModel,osVersion,mockLocationDetected);

@override
String toString() {
  return 'MarkAttendanceOTPRequest(sessionId: $sessionId, otpCode: $otpCode, latitude: $latitude, longitude: $longitude, deviceId: $deviceId, deviceModel: $deviceModel, osVersion: $osVersion, mockLocationDetected: $mockLocationDetected)';
}


}

/// @nodoc
abstract mixin class _$MarkAttendanceOTPRequestCopyWith<$Res> implements $MarkAttendanceOTPRequestCopyWith<$Res> {
  factory _$MarkAttendanceOTPRequestCopyWith(_MarkAttendanceOTPRequest value, $Res Function(_MarkAttendanceOTPRequest) _then) = __$MarkAttendanceOTPRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'session_id') String sessionId,@JsonKey(name: 'otp_code') String otpCode, double latitude, double longitude,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'device_model') String deviceModel,@JsonKey(name: 'os_version') String osVersion,@JsonKey(name: 'mock_location_detected') bool mockLocationDetected
});




}
/// @nodoc
class __$MarkAttendanceOTPRequestCopyWithImpl<$Res>
    implements _$MarkAttendanceOTPRequestCopyWith<$Res> {
  __$MarkAttendanceOTPRequestCopyWithImpl(this._self, this._then);

  final _MarkAttendanceOTPRequest _self;
  final $Res Function(_MarkAttendanceOTPRequest) _then;

/// Create a copy of MarkAttendanceOTPRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? otpCode = null,Object? latitude = null,Object? longitude = null,Object? deviceId = null,Object? deviceModel = null,Object? osVersion = null,Object? mockLocationDetected = null,}) {
  return _then(_MarkAttendanceOTPRequest(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,otpCode: null == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,deviceModel: null == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String,osVersion: null == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String,mockLocationDetected: null == mockLocationDetected ? _self.mockLocationDetected : mockLocationDetected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$RequestOTPRequest {

@JsonKey(name: 'session_id') String get sessionId;
/// Create a copy of RequestOTPRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestOTPRequestCopyWith<RequestOTPRequest> get copyWith => _$RequestOTPRequestCopyWithImpl<RequestOTPRequest>(this as RequestOTPRequest, _$identity);

  /// Serializes this RequestOTPRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestOTPRequest&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'RequestOTPRequest(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $RequestOTPRequestCopyWith<$Res>  {
  factory $RequestOTPRequestCopyWith(RequestOTPRequest value, $Res Function(RequestOTPRequest) _then) = _$RequestOTPRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'session_id') String sessionId
});




}
/// @nodoc
class _$RequestOTPRequestCopyWithImpl<$Res>
    implements $RequestOTPRequestCopyWith<$Res> {
  _$RequestOTPRequestCopyWithImpl(this._self, this._then);

  final RequestOTPRequest _self;
  final $Res Function(RequestOTPRequest) _then;

/// Create a copy of RequestOTPRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestOTPRequest].
extension RequestOTPRequestPatterns on RequestOTPRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestOTPRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestOTPRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestOTPRequest value)  $default,){
final _that = this;
switch (_that) {
case _RequestOTPRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestOTPRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RequestOTPRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_id')  String sessionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestOTPRequest() when $default != null:
return $default(_that.sessionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_id')  String sessionId)  $default,) {final _that = this;
switch (_that) {
case _RequestOTPRequest():
return $default(_that.sessionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'session_id')  String sessionId)?  $default,) {final _that = this;
switch (_that) {
case _RequestOTPRequest() when $default != null:
return $default(_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestOTPRequest implements RequestOTPRequest {
  const _RequestOTPRequest({@JsonKey(name: 'session_id') required this.sessionId});
  factory _RequestOTPRequest.fromJson(Map<String, dynamic> json) => _$RequestOTPRequestFromJson(json);

@override@JsonKey(name: 'session_id') final  String sessionId;

/// Create a copy of RequestOTPRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestOTPRequestCopyWith<_RequestOTPRequest> get copyWith => __$RequestOTPRequestCopyWithImpl<_RequestOTPRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestOTPRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestOTPRequest&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'RequestOTPRequest(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$RequestOTPRequestCopyWith<$Res> implements $RequestOTPRequestCopyWith<$Res> {
  factory _$RequestOTPRequestCopyWith(_RequestOTPRequest value, $Res Function(_RequestOTPRequest) _then) = __$RequestOTPRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'session_id') String sessionId
});




}
/// @nodoc
class __$RequestOTPRequestCopyWithImpl<$Res>
    implements _$RequestOTPRequestCopyWith<$Res> {
  __$RequestOTPRequestCopyWithImpl(this._self, this._then);

  final _RequestOTPRequest _self;
  final $Res Function(_RequestOTPRequest) _then;

/// Create a copy of RequestOTPRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(_RequestOTPRequest(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
