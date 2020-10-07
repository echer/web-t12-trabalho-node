import 'package:app/data/domain/usuario.dart';
import 'package:app/data/repository/remote/dto/login.dart';
import 'package:app/data/repository/usuario-repository.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  UsuarioRepository repository = new UsuarioRepository();

  Future<Login> login(Usuario usuario) async {
    return await repository.login(usuario);
  }
}
