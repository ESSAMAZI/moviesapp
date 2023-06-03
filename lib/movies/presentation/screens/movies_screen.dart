import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/core/utils/app_String.dart';
import 'package:movies_app/movies/presentation/Widget/custom_container_movies_screen.dart';
import 'package:movies_app/movies/presentation/components/now_playing_component.dart';
import 'package:movies_app/movies/presentation/components/popular_component.dart';
import 'package:movies_app/movies/presentation/components/top_rated_component.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  print('build');
    return BlocProvider(
      //اضافة الاحداث البلوكٍ
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        //
        ..add(GetPopularMoviesEvent())
        //
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponent(),
              CustomContainerMoviesScreen(
                  textPopular: AppString.popular, onTap: () {}),
              const PopularComponent(),
              CustomContainerMoviesScreen(
                  textPopular: AppString.topRated, onTap: () {}),
              const TopRatedComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
