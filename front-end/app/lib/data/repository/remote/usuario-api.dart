import 'package:app/data/domain/usuario.dart';
import 'package:app/data/repository/remote/dto/login.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'usuario-api.g.dart';

@RestApi(baseUrl: "https://alan-echer-webt12-trabalho.herokuapp.com/usuarios")
abstract class UsuarioAPI {
  factory UsuarioAPI(Dio dio, {String baseUrl}) {
    return _UsuarioAPI(dio, baseUrl: baseUrl);
  }
  @POST("/login")
  Future<Login> login(@Body() Usuario usuario);
  @POST("/")
  Future create(@Body() Usuario usuario);
  @PUT("/{id}")
  Future update(@Path() String id, @Body() Usuario obj);
  @DELETE("/{id}")
  Future delete(@Path() String id);
}
