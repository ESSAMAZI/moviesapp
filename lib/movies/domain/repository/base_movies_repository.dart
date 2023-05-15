import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

abstract class BaseMoviesRepository {
  //الاشياء او المتطلبات التي نريد ان نعملها في التطبيق

  //حلب بيانات الافلام الحديثه
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  //جلب بيانات أفلام الشائعة
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  //الحصول على تصنيف الأفلام
  Future<Either<Failure, List<Movie>>> getToRatedMovies();
}
