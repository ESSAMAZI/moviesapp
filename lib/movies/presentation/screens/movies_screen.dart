import 'package:flutter/material.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  // List<Movie> movies = [];
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}



//StatefulWidget

  // @override
  // void initState() {
  //   super.initState();
  //   _getData();
  // }

  // void _getData() async {
  //   BaseMovieRemoteDataSource baseMovieRemoteDataSource =
  //       MovieRemoteDataSource();
  //   //
  //   BaseMoviesRepository moviesRepository =
  //       MoviesRepository(baseMovieRemoteDataSource);
  //   //
  //   final result =
  //       await GetNowPlayingMoviesUseCase(baseMoviesRepository: moviesRepository)
  //           .execute();
  //   result.fold((l) => null, (lsit) {
  //     movies = lsit;
  //   });
  //   print(result);
  // }