// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    _RegisterResponse(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      department: json['department'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$RegisterResponseToJson(_RegisterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'department': instance.department,
      'created_at': instance.createdAt.toIso8601String(),
    };

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      id: json['id'] as String,
      token: json['token'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
    };
