import 'package:app/data/domain/veiculo.dart';
import 'package:app/data/repository/remote/veiculo-api.dart';
import 'package:app/data/service/service-locator.dart';
import 'package:dio/dio.dart';

class VeiculoRepository {
  Future<List<Veiculo>> list() async {
    Dio dio = getIt<Dio>();
    VeiculoAPI api = VeiculoAPI(dio);
    return api.list();
  }

  Future create(Veiculo obj) async {
    Dio dio = getIt<Dio>();
    VeiculoAPI api = VeiculoAPI(dio);
    return api.create(obj);
  }

  Future update(Veiculo obj) async {
    Dio dio = getIt<Dio>();
    VeiculoAPI api = VeiculoAPI(dio);
    return api.update(obj.id, obj);
  }
}
