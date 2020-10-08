import 'package:app/data/domain/aviso.dart';
import 'package:app/data/repository/remote/aviso-api.dart';
import 'package:app/data/service/service-locator.dart';
import 'package:dio/dio.dart';

class AvisoRepository {
  Future<List<Aviso>> list() async {
    Dio dio = getIt<Dio>();
    AvisoAPI api = AvisoAPI(dio);
    return api.list();
  }

  Future create(Aviso obj) async {
    Dio dio = getIt<Dio>();
    AvisoAPI api = AvisoAPI(dio);
    return api.create(obj);
  }

  Future update(Aviso obj) async {
    Dio dio = getIt<Dio>();
    AvisoAPI api = AvisoAPI(dio);
    return api.update(obj.id, obj);
  }

  Future delete(Aviso obj) async {
    Dio dio = getIt<Dio>();
    AvisoAPI api = AvisoAPI(dio);
    return api.delete(obj.id);
  }
}
