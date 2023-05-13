import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUseCase({
    required this.baseMoviesRepository,
  });
  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getToRatedMovies();
  }
}
