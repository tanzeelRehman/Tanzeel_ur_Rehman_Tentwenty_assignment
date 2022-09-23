import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:movie_db/Base/BaseClient.dart';
import 'package:movie_db/Models/movies_model.dart';
import 'package:movie_db/Services/LocalDbService.dart';

class MoviesListController extends GetxController {
  @override
  void onInit() {
    checkInternetConnection();
    getMovies('');
    super.onInit();
  }

  var moviesList = <Results>[].obs;

  Future<void> getMovies(String movieName) async {
    var movies = await BaseClientService.getMoviesList(movieName);

    moviesList.value = movies.results;
  }

  var isConnectedToInternet = true.obs;

  Future<void> checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.kindacode.com');
      if (response.isNotEmpty) {
        isConnectedToInternet = true.obs;
      }
    } on SocketException catch (err) {
      isConnectedToInternet = false.obs;
    }
  }
}
