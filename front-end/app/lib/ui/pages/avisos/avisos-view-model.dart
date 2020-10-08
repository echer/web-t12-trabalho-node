import 'package:app/data/domain/aviso.dart';
import 'package:app/data/repository/aviso-repository.dart';
import 'package:flutter/material.dart';

class AvisosViewModel extends ChangeNotifier {
  AvisoRepository repository = new AvisoRepository();

  List<Aviso> lista = List<Aviso>();

  Future<void> list() async {
    this.lista = await repository.list();
    notifyListeners();
  }

  Future<void> createOrUpdate(Aviso obj) {
    if (obj.id.isEmpty) {
      obj.id = null;
      return repository.create(obj);
    }
    return repository.update(obj);
  }

  Future<void> delete(Aviso obj) {
    return repository.delete(obj);
  }
}
