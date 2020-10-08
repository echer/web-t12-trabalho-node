import 'package:app/data/domain/veiculo.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'veiculo-api.g.dart';

@RestApi(baseUrl: "https://alan-echer-webt12-trabalho.herokuapp.com/veiculos")
abstract class VeiculoAPI {
  factory VeiculoAPI(Dio dio, {String baseUrl}) {
    return _VeiculoAPI(dio, baseUrl: baseUrl);
  }
  @GET("/")
  Future<List<Veiculo>> list();

  @POST("/")
  Future create(@Body() Veiculo obj);

  @PUT("/{id}")
  Future update(@Path() String id, @Body() Veiculo obj);

  @DELETE("/{id}")
  Future delete(@Path() String id);
}
