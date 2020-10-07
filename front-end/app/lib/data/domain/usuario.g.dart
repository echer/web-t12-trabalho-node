// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return Usuario(
    id: json['_id'] as String,
    nome: json['nome'] as String,
    email: json['email'] as String,
    senha: json['senha'] as String,
  );
}

Map<String, dynamic> _$UsuarioToJson(Usuario instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('nome', instance.nome);
  writeNotNull('email', instance.email);
  writeNotNull('senha', instance.senha);
  return val;
}
