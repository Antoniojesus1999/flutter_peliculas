import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apikey = '9607db878e5714f3ffe6fb1a6f6e36c3';
  final String _language = 'es-ES';
  List<Movie> ondDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;

  MoviesProvider() {
    getOnDsiplayMovies();
    getPopularMovies();
  }

  void getOnDsiplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    ondDisplayMovies = nowPlayingResponse.results;
    notifyListeners(); // Sirve para que redibuge el widget con los cambios, notifica a los widget
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponses = PopularResponses.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponses.results];
    notifyListeners();
  }

  Future<String> _getJsonData(String endPoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endPoint,
        {'language': _language, 'api_key': _apikey, 'page': '$page'});

    final response = await http.get(url);
    return response.body;
  }
}
