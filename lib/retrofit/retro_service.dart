import 'package:dio/dio.dart';
import 'package:firebase_model/retrofit/model/movie_retro.dart';
import 'package:retrofit/retrofit.dart';


part 'retro_service.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3')
abstract class MovieRetro{
  static String _api_key = '2a0f926961d00c667e14461f8';//put your api key here


  factory MovieRetro(Dio dio, {String baseUrl}){
    dio.options = BaseOptions(
        queryParameters: {
          'api_key': _api_key,
          'language': 'en-Us',
          'page': 1,
        }
    );

    return _MovieRetro(dio,baseUrl:baseUrl);
  }


  @GET('/movie/popular')
  Future<MovieResponse> getMovies();

}