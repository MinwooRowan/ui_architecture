// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemoEntity _$DemoEntityFromJson(Map<String, dynamic> json) => DemoEntity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      tapped: json['tapped'] as bool? ?? false,
    );

Map<String, dynamic> _$DemoEntityToJson(DemoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'tapped': instance.tapped,
    };
