import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:peliculas/models/now_playing_response.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apikey = '9607db878e5714f3ffe6fb1a6f6e36c3';
  final String _language = 'es-ES';
  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnDsiplayMovies();
  }

  void getOnDsiplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'language': _language, 'api_key': _apikey, 'page': '1'});

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    print(nowPlayingResponse.results[1].title);
  }
}
