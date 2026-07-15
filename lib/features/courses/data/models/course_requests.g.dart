// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateCourseRequest _$CreateCourseRequestFromJson(Map<String, dynamic> json) =>
    _CreateCourseRequest(
      title: json['title'] as String,
      code: json['code'] as String,
      department: json['department'] as String,
    );

Map<String, dynamic> _$CreateCourseRequestToJson(
  _CreateCourseRequest instance,
) => <String, dynamic>{
  'title': instance.title,
  'code': instance.code,
  'department': instance.department,
};

_JoinCourseRequest _$JoinCourseRequestFromJson(Map<String, dynamic> json) =>
    _JoinCourseRequest(
      inviteCode: json['invite_code'] as String,
      matriculationNumber: json['matriculation_number'] as String,
    );

Map<String, dynamic> _$JoinCourseRequestToJson(_JoinCourseRequest instance) =>
    <String, dynamic>{
      'invite_code': instance.inviteCode,
      'matriculation_number': instance.matriculationNumber,
    };

_UpdateCourseSettingsRequest _$UpdateCourseSettingsRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateCourseSettingsRequest(
  confidenceThreshold: (json['confidence_threshold'] as num).toDouble(),
);

Map<String, dynamic> _$UpdateCourseSettingsRequestToJson(
  _UpdateCourseSettingsRequest instance,
) => <String, dynamic>{'confidence_threshold': instance.confidenceThreshold};
