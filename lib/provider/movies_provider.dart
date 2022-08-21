import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnDsiplayMovies();
  }

  void getOnDsiplayMovies() async {
    print('getOnDisplayMovies');
  }
}
