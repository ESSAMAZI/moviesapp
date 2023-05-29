import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  //GetNowPlayingMoviesUseCase كل مره اجي استخدم البلوك هذا نرسل له كائن من
  //ServicesLocator الي هو مخزن في
  //MoviesScreen كما في صفحة  SLفقط نرسل له
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  //الباني(
  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    //
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    //
    on<GetPopularMoviesEvent>(_getPopularMovies);
    //
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }
  //event استدعاء اول حدث
  //  on<GetNowPlayingMoviesEvent>((event, emit) async {
  /*
   services تم نقلها الى مجلد 
     //3
      // BaseMovieRemoteDataSource baseMovieRemoteDataSource =
      //     MovieRemoteDataSource();
      // //2
      // BaseMoviesRepository baseMoviesRepository =
      //     MoviesRepository(baseMovieRemoteDataSource);

        //1 UseCase
      final result =
          // await GetNowPlayingMoviesUseCase(baseMoviesRepository).execute();
    */
  //1 UseCase
  // Bloc المنظر النهائي لــ
  //ServicesLocator في inget  التي انا عمل لهاGetNowPlayingMoviesUseCase رح ترجع لك من result
  //  });

  // on<GetPopularMoviesEvent>((event, emit) async {});
  ///}

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    //final result = await getNowPlayingMoviesUseCase.execute();
    final result =
        await getNowPlayingMoviesUseCase(const NoParameters()); //call
    //تم الحصول على بيانات
    result.fold(
        //في حاله حصل اي خطى
        (l) => emit(
              state.copyWith(
                  nowPlayingState: RequestState.error,
                  nowPlayingMessage: l.message),
              // MoviesState(
              //     nowPlayingState: RequestState.error,
              //     nowPlayingMessage: l.message)
            ),
        //في حالة تم الحصول على البيانات
        (r) => emit(state.copyWith(
                nowPlayingMovies: r, nowPlayingState: RequestState.loaded)
            // MoviesState(
            //   nowPlayingMovies: r, nowPlayingState: RequestState.loaded),
            ));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMessage: l.message)),
        (r) => emit(state.copyWith(
            popularMovies: r, popularState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              topRatedMessage: l.message,
              topRatedState: RequestState.error,
            )),
        (r) => emit(state.copyWith(
              topRatedMovies: r,
              topRatedState: RequestState.loaded,
            )));
  }
}
