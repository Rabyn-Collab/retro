import 'package:firebase_model/retrofit/model/movie_result.dart';
import 'package:json_annotation/json_annotation.dart';

//flutter pub run build_runner build
//flutter pub run build_runner build --delete-conflicting-outputs
part 'movie_retro.g.dart';
@JsonSerializable()
class MovieResponse {
  @JsonKey(name:'page')
  int page;

  @JsonKey(name: 'results')
  List<Results> results;

  @JsonKey(name: 'total_pages')
  int totalPages;

  @JsonKey(name: 'total_results')
  int totalResults;

  MovieResponse({this.page, this.results, this.totalPages, this.totalResults});


  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);

}

