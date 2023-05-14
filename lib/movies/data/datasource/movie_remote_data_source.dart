import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/data/model/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  //نكتب فقط اسماء المهام المطلوبه
  Future<List<MovieModel>> getNowPlayingMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  //usecases الذي يحتوي على مجلد Domain نكتب الدوال حددناها مسبقا في مجلد
  //APIالتي تحتوي علي

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      //data["results"] التي التحتوي على البيانات التي نريدها
      //List من اجل نستقبلها ونلف على البيانات ونستقبلهاعلى شكل
      // هي تمثل كل بيانات عنصر راجع اليناe
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      //معالجة الاخطاء عن طريق اخذ بيانات الخطى الرجاع كامل عن طريق مودل
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
