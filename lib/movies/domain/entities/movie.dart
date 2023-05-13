// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final String originalLanguage;
  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.originalLanguage,
  });

  // List<Object?> get props => throw UnimplementedError();
  //نخلي نفس الكلاس متشابه
  @override
  List<Object> get props {
    return [
      id,
      title,
      backdropPath,
      genreIds,
      overview,
      voteAverage,
      releaseDate,
      originalLanguage,
    ];
  }

  //التاكد من ان الكائنات التي تتشابه في القيم اي لديها نفس القيم
  // لا تحجز مكان اخر في الذاكره
  // حيث يكون الهاش كود متشابه
  //Equatableيمكن استخدام هذا الكود الو الحزمه التاليه
  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Movie &&
  //         runtimeType == other.runtimeType &&
  //         id == other.id &&
  //         title == other.title &&
  //         backdropPath == other.backdropPath &&
  //         genreIds == other.genreIds &&
  //         overview == other.overview &&
  //         voteAverage == other.voteAverage &&
  //         releaseDate == other.releaseDate &&
  //         originalLanguage == other.originalLanguage;

  // @override
  // int get hashCode =>
  //     id.hashCode ^
  //     title.hashCode ^
  //     backdropPath.hashCode ^
  //     genreIds.hashCode ^
  //     overview.hashCode ^
  //     voteAverage.hashCode ^
  //     releaseDate.hashCode ^
  //     originalLanguage.hashCode;
}
