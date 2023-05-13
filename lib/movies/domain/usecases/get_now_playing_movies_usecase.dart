// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUseCase({
    required this.baseMoviesRepository,
  });
  // نكتب وظائف هذا الكلاس
  // اول وظيفه هي جلب بيانات
  // التي ترجع لنا Movie والبيانات من نوع
  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getNowPlaying();
  }
}
