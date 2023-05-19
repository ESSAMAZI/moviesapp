import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  //GetNowPlayingMoviesUseCase كل مره اجي استخدم البلوك هذا نرسل له كائن من
  //ServicesLocator الي هو مخزن في
  //MoviesScreen كما في صفحة  SLفقط نرسل له
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesState()) {
    //event استدعاء اول حدث
    on<GetNowPlayingMoviesEvent>((event, emit) async {
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
      final result = await getNowPlayingMoviesUseCase.execute();
      //تم الحصول على بيانات
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
