// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemoModel _$DemoModelFromJson(Map<String, dynamic> json) => DemoModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$DemoModelToJson(DemoModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
