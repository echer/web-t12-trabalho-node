import 'package:json_annotation/json_annotation.dart';

part 'usuario.g.dart';

@JsonSerializable(includeIfNull: false)
class Usuario {
  @JsonKey(name: "_id")
  String id;
  String nome;
  String email;
  String senha;

  Usuario({
    this.id,
    this.nome,
    this.email,
    this.senha,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
