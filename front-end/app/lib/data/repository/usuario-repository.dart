import 'package:app/data/domain/usuario.dart';
import 'package:app/data/repository/remote/dto/login.dart';
import 'package:app/data/repository/remote/usuario-api.dart';
import 'package:app/data/service/service-locator.dart';
import 'package:dio/dio.dart';

class UsuarioRepository {
  Future<Login> login(Usuario usuario) async {
    Dio dio = getIt<Dio>();
    UsuarioAPI api = UsuarioAPI(dio);
    return api.login(usuario);
  }

  Future create(Usuario usuario) async {
    Dio dio = getIt<Dio>();
    UsuarioAPI api = UsuarioAPI(dio);
    return api.inserir(usuario);
  }
}
