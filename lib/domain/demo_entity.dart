import 'package:json_annotation/json_annotation.dart';
import 'package:provider_architectire/data/demo_model.dart';

part 'demo_entity.g.dart';

@JsonSerializable()
class DemoEntity extends DemoModel {
  final bool tapped;
  DemoEntity({
    required super.id,
    required super.name,
    required super.description,
    this.tapped = false,
  });

  factory DemoEntity.fromJson(Map<String, dynamic> json) =>
      _$DemoEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DemoEntityToJson(this);

  factory DemoEntity.fromModel(DemoModel model) {
    return DemoEntity.fromJson(model.toJson());
  }

  DemoEntity copyWith({
    String? name,
    String? description,
    bool? tapped,
  }) {
    return DemoEntity(
      id: super.id,
      name: name ?? this.name,
      description: description ?? this.description,
      tapped: tapped ?? this.tapped,
    );
  }
}
