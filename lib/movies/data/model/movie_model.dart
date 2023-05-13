import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  //Movie ننادي على كل المتغيرات الموجوده في كلاس
  //entities  الموجود في ملف Domain الموجود في مجلد
  const MovieModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genreIds,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate,
      required super.originalLanguage});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
        overview: json["overview"],
        voteAverage: json["vote_average"].toDouble(),
        releaseDate: json["release_date"],
        originalLanguage: json['original_language'],
      );
}
