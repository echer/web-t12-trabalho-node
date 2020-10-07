// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'veiculo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Veiculo _$VeiculoFromJson(Map<String, dynamic> json) {
  return Veiculo(
    id: json['_id'] as String,
    nome: json['nome'] as String,
  );
}

Map<String, dynamic> _$VeiculoToJson(Veiculo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('nome', instance.nome);
  return val;
}
