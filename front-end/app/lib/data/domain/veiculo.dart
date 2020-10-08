import 'package:json_annotation/json_annotation.dart';

part 'veiculo.g.dart';

@JsonSerializable(includeIfNull: false)
class Veiculo {
  @JsonKey(name: "_id")
  String id;
  String marca;
  String modelo;
  String placa;
  int ano;

  Veiculo({
    this.id,
    this.marca,
    this.modelo,
    this.placa,
    this.ano,
  });

  factory Veiculo.fromJson(Map<String, dynamic> json) =>
      _$VeiculoFromJson(json);
  Map<String, dynamic> toJson() => _$VeiculoToJson(this);
}
