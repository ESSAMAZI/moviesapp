import 'package:movies_app/movies/domain/entities/movie.dart';

abstract class BaseMoviesRepository {
  //الاشياء او المتطلبات التي نريد ان نعملها في التطبيق

  //حلب بيانات الافلام الحديثه
  Future<List<Movie>> getNowPlaying();
  //جلب بيانات أفلام الشائعة
  Future<List<Movie>> getPopularMovies();
  //الحصول على تصنيف الأفلام
  Future<List<Movie>> getToRatedMovies();
}
