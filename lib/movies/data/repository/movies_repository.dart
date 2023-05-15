import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

//domain -> repositoryالتعامل مع مجلد
//DataSourceوايضا نتعامل هنا مع المصدر
// call data اجلب البيانات اعمل لها
class MoviesRepository extends BaseMoviesRepository {
  //DataSource ناتي نخاطب ملف
  //abstract الذي يمثل نوع
  //MovieRemoteDataSource  ولا نتخاطب مع كلاس مباشره
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);
  //
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    //رح يرجع نوعين من البيانات ولذلك من اجل ان نستقبل
    // نوعين من البيانات مختلفين ومهما
    //List<Movie and ServerException
    //getNowPlayingMoviesالتي رح ترجع لنا من الداله هذه
    //dartz (Either)ولذلك تم حل المشكلة عن طريق حزمه
    //ويستقبل نوعين من البيانات
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      //List<Movie> النوع الاول
      return Right(result);
    }
    //النوع الثاني
    // هذا فقط ServerException لا يكمن ان نجعلها تستقبل dartzالداله
    //سواء كان  Exceptionبالنهايه انا اريدان اجعلها ترجع عن طريق كلاس واحد فقط كل
    //سواء كان في السيرفر او كان في قاعده بيانات محليه
    //يحتوي عليهما الاثنين حيث يشتركان مع بعض في رساله الخطى Failureلذلك قمنا بمعل كلاس اسمه
    on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
      //في حاله قاعده البيانات المحليه
      //on LocaclDatabaseException catch (failure) {
      // return left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getToRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
