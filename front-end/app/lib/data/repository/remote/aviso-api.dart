import 'package:app/data/domain/aviso.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'aviso-api.g.dart';

@RestApi(baseUrl: "https://alan-echer-webt12-trabalho.herokuapp.com/avisos")
abstract class AvisoAPI {
  factory AvisoAPI(Dio dio, {String baseUrl}) {
    return _AvisoAPI(dio, baseUrl: baseUrl);
  }
  @GET("/")
  Future<List<Aviso>> list();

  @POST("/")
  Future create(@Body() Aviso obj);

  @PUT("/{id}")
  Future update(@Path() String id, @Body() Aviso obj);

  @DELETE("/{id}")
  Future delete(@Path() String id);
}
