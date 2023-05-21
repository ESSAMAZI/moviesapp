import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesScreend extends StatelessWidget {
  const MoviesScreend({super.key});

  // List<Movie> movies = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        // اول ما تعمل انشاء لبلوك رح نادي على الحدث
        //slنرسل بيانات الكائن الموجود في
        return MoviesBloc(sl())..add(GetNowPlayingMoviesEvent());
      },
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          //الوصول الى الحاله
          // print(state);
          return const Scaffold();
        },
      ),
    );
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
