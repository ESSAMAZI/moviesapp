// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>> {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUseCase({required this.baseMoviesRepository});
  // نكتب وظائف هذا الكلاس
  // اول وظيفه هي جلب بيانات
  // التي ترجع لنا Movie والبيانات من نوع
  @override
  Future<Either<Failure, List<Movie>>> call() async {
    //call عباره داله تستدعي عند استخدام كائن لكلاس بدون ما نحتاج ان نذكر اسمها
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
