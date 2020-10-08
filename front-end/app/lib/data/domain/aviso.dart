import 'package:json_annotation/json_annotation.dart';

part 'aviso.g.dart';

@JsonSerializable(includeIfNull: false)
class Aviso {
  @JsonKey(name: "_id")
  String id;
  String nome;

  Aviso({
    this.id,
    this.nome,
  });

  factory Aviso.fromJson(Map<String, dynamic> json) =>
      _$AvisoFromJson(json);
  Map<String, dynamic> toJson() => _$AvisoToJson(this);
}
