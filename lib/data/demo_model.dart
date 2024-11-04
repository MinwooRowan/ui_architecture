import 'package:json_annotation/json_annotation.dart';

part 'demo_model.g.dart';

@JsonSerializable()
class DemoModel {
  final int id;
  final String name;
  final String description;

  DemoModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory DemoModel.fromJson(Map<String, dynamic> json) =>
      _$DemoModelFromJson(json);

  Map<String, dynamic> toJson() => _$DemoModelToJson(this);
}
