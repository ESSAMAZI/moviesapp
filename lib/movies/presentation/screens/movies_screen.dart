import 'package:flutter/material.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<Movie> movies = [];
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    BaseMovieRemoteDataSource baseMovieRemoteDataSource =
        MovieRemoteDataSource();
    //
    BaseMoviesRepository moviesRepository =
        MoviesRepository(baseMovieRemoteDataSource);
    //
    final result =
        await GetNowPlayingMoviesUseCase(baseMoviesRepository: moviesRepository)
            .execute();
    result.fold((l) => null, (lsit) {
      movies = lsit;
    });
    print(result);
  }
}
