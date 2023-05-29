// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetail, MovieDetailsParameters> {
  //<List<MovieDetail>>حيث تم ارسال بيانات فلم واحد فقط لذلك نحن لم نستخدم
  final BaseMoviesRepository baseMoviesRepository;
  //
  GetMovieDetailsUseCase({required this.baseMoviesRepository});

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails();
  }
}

class MovieDetailsParameters extends Equatable {
  //نكتب المتغيرات التي نريد ان نتعامل معاها
  final int movieId;
  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
