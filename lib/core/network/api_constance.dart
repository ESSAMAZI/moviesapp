class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "692c1ff26c74ffbcc95a272c154a11c7";
  //
  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  //
  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";
  //
  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";
  //داله
  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";
  //
  static String recommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  //image
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}

//api.themoviedb.org/3/movie/now_playing?language=ar-US&page=1&api_key=692c1ff26c74ffbcc95a272c154a11c7
//Details movies
//https://api.themoviedb.org/3/movie/385687?language=ar&page=1&api_key=692c1ff26c74ffbcc95a272c154a11c7
//recommendations الافلام المشابه لها
//https://api.themoviedb.org/3/movie/385687/recommendations?language=en-US&page=1&api_key=692c1ff26c74ffbcc95a272c154a11c7