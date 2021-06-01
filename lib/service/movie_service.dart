import 'package:dio/dio.dart';
import 'package:firebase_model/models/movie.dart';
import 'package:firebase_model/retrofit/model/movie_retro.dart';
import 'package:firebase_model/retrofit/retro_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';





class MovieService{
  final dio = Dio();



  Future<MovieResponse> getMov() async{

    MovieRetro _movies = MovieRetro(Dio());

  MovieResponse movies = await _movies.getMovies();

    return movies;

  }




}


final providerMovie = FutureProvider((ref) => MovieService().getMov());


