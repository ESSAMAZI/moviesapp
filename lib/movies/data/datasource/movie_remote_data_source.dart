import 'package:dio/dio.dart';
import 'package:movies_app/movies/data/model/movie_model.dart';

class BaseMovieRemoteDataSource {
  //usecases الذي يحتوي على مجلد Domain نكتب الدوال حددناها مسبقا في مجلد
  //APIالتي تحتوي علي

  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/now_playing?language=ar-US&page=1&api_key=692c1ff26c74ffbcc95a272c154a11c7');

    if (response.statusCode == 200) {
      //data["results"] التي التحتوي على البيانات التي نريدها
      //List من اجل نستقبلها ونلف على البيانات ونستقبلهاعلى شكل
      // هي تمثل كل بيانات عنصر راجع اليناe
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else
      return [];
  }
}
