// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final int id;
  final List<Genres> genres;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final String voteAverage;
  const MovieDetail({
    required this.backdropPath,
    required this.id,
    required this.genres,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object> get props {
    return [
      backdropPath,
      id,
      genres,
      overview,
      releaseDate,
      runtime,
      title,
      voteAverage,
    ];
  }
}


//https://api.themoviedb.org/3/movie/385687?language=en-US&page=1&api_key=692c1ff26c74ffbcc95a272c154a11c7