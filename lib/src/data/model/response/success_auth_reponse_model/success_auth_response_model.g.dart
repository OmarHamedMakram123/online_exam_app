// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessAuthResponseModel _$SuccessAuthResponseModelFromJson(
        Map<String, dynamic> json) =>
    SuccessAuthResponseModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SuccessAuthResponseModelToJson(
        SuccessAuthResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
    };
