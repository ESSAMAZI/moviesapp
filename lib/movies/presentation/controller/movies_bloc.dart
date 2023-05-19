import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(const MoviesState()) {
    //event استدعاء اول حدث
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      //3
      BaseMovieRemoteDataSource baseMovieRemoteDataSource =
          MovieRemoteDataSource();
      //2
      BaseMoviesRepository baseMoviesRepository =
          MoviesRepository(baseMovieRemoteDataSource);
      //1 UseCase
      final result = await GetNowPlayingMoviesUseCase(
              baseMoviesRepository: baseMoviesRepository)
          .execute();
      //تم الحصول على بيانات
      // emit(const MoviesState(nowPlayingState: RequestState.loaded));
      result.fold(
          //في حاله حصل اي خطى
          (l) => emit(MoviesState(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message)),
          //في حالة تم الحصول على البيانات
          (r) => emit(MoviesState(
              nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
    });
  }
}
