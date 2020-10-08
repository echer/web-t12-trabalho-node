// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aviso.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Aviso _$AvisoFromJson(Map<String, dynamic> json) {
  return Aviso(
    id: json['_id'] as String,
    titulo: json['titulo'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$AvisoToJson(Aviso instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('titulo', instance.titulo);
  writeNotNull('message', instance.message);
  return val;
}
