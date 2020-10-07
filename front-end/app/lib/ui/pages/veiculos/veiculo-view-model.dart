import 'package:app/data/domain/veiculo.dart';
import 'package:app/data/repository/veiculo-repository.dart';
import 'package:flutter/material.dart';

class VeiculoViewModel extends ChangeNotifier {
  VeiculoRepository repository = new VeiculoRepository();

  List<Veiculo> lista = List<Veiculo>();

  Future<void> list() async {
    this.lista = await repository.list();
    notifyListeners();
  }

  Future<void> createOrUpdate(Veiculo obj) {
    if (obj.id.isEmpty) {
      obj.id = null;
      return repository.create(obj);
    }
    return repository.update(obj);
  }
}
