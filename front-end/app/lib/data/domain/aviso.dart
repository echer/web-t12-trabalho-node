import 'package:json_annotation/json_annotation.dart';

part 'aviso.g.dart';

@JsonSerializable(includeIfNull: false)
class Aviso {
  @JsonKey(name: "_id")
  String id;
  String titulo;
  String message;

  Aviso({
    this.id,
    this.titulo,
    this.message,
  });

  factory Aviso.fromJson(Map<String, dynamic> json) => _$AvisoFromJson(json);
  Map<String, dynamic> toJson() => _$AvisoToJson(this);
}
