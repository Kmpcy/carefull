// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEorrModel _$ApiEorrModelFromJson(Map<String, dynamic> json) => ApiEorrModel(
  meesage: json['meesage'] as String,
  statusCode: (json['statusCode'] as num).toInt(),
);

Map<String, dynamic> _$ApiEorrModelToJson(ApiEorrModel instance) =>
    <String, dynamic>{
      'meesage': instance.meesage,
      'statusCode': instance.statusCode,
    };
