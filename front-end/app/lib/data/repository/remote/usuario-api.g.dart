// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario-api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _UsuarioAPI implements UsuarioAPI {
  _UsuarioAPI(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://alan-echer-webt12-trabalho.herokuapp.com/usuarios';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<Login> login(usuario) async {
    ArgumentError.checkNotNull(usuario, 'usuario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(usuario?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Login.fromJson(_result.data);
    return value;
  }

  @override
  Future<dynamic> inserir(usuario) async {
    ArgumentError.checkNotNull(usuario, 'usuario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(usuario?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request('/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }
}
