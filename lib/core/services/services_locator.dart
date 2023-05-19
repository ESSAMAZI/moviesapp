import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Use Cases
    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(baseMoviesRepository: sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(sl()),
      //BaseMovieRemoteDataSource يستقبل كائن من BaseMoviesRepository لان كلاس يريد
      //BaseMovieRemoteDataSource الذي تم انشاءها من sl كائن من
    );

    /// DATA SOURCE
    //DataSourceنخزن كائن من نوع
    //registerLazySingleton<نحدد الكائن الذي نحن رح نستخدمه >
    // اي الكائن لا تنشئه ولا تستخدمه الا بعد ما انادي عليه
    //الكائن الي انت رح تكريته لا تكريته الا لما انا استدعي الكائن ده
    //design patterns singleton
    // اي نحن نقول لما انا انادي على الكائن ..نادي لي على نفس الكائن الذي انت كريته هنا
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}