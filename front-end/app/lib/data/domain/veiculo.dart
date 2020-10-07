import 'package:json_annotation/json_annotation.dart';

part 'veiculo.g.dart';

@JsonSerializable(includeIfNull: false)
class Veiculo {
  @JsonKey(name: "_id")
  String id;
  String nome;

  Veiculo({
    this.id,
    this.nome,
  });

  factory Veiculo.fromJson(Map<String, dynamic> json) =>
      _$VeiculoFromJson(json);
  Map<String, dynamic> toJson() => _$VeiculoToJson(this);
}
