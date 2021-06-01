// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retro_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _MovieRetro implements MovieRetro {
  _MovieRetro(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://api.themoviedb.org/3';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getMovies() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/movie/popular',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MovieResponse.fromJson(_result.data);
    return Future.value(value);
  }
}
