// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'veiculo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Veiculo _$VeiculoFromJson(Map<String, dynamic> json) {
  return Veiculo(
    id: json['_id'] as String,
    marca: json['marca'] as String,
    modelo: json['modelo'] as String,
    placa: json['placa'] as String,
    ano: json['ano'] as int,
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
  writeNotNull('marca', instance.marca);
  writeNotNull('modelo', instance.modelo);
  writeNotNull('placa', instance.placa);
  writeNotNull('ano', instance.ano);
  return val;
}
