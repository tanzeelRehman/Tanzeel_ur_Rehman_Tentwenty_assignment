import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:movie_db/Base/Exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:movie_db/Models/movie_details_model.dart';
import 'package:movie_db/Models/movies_model.dart';

class BaseClientService {
  static const int time_out_duration = 10;

  static const _key = '119fea29ff8649b7d4d8c9efdcccfdf9';
  static const _base_url = 'https://api.themoviedb.org/3/';

  //! GETTING UP COMMING MOVIES LIST////////////////////////////////////////////
  static Future<MoviesModel> getMoviesList(String searchQuery) async {
    print("Searh Query is");
    print(searchQuery.isEmpty);
    String _movies_endpoint =
        searchQuery.isEmpty ? 'movie/upcoming' : 'search/movie';
    String _querypharms = searchQuery.isEmpty
        ? '&language=en-US&page=1&include_adult=false'
        : '&language=en-US&page=1&include_adult=false&query=$searchQuery';

    var _uri =
        Uri.parse('$_base_url$_movies_endpoint?api_key=$_key$_querypharms');
    print(_uri);

    try {
      var response = await http
          .get(
            _uri,
          )
          .timeout(const Duration(seconds: time_out_duration));
      if (response.statusCode == 200) {
        print("Og yes adding data");
        APICacheDBModel cacheDBModel =
            new APICacheDBModel(key: 'MOVIE_API', syncData: response.body);
        await APICacheManager().addCacheData(cacheDBModel);
      }
      return _processResponse(response, false);
    } on SocketException {
      var response = await APICacheManager().getCacheData('MOVIE_API');
      var jsonString = jsonDecode(response.syncData);
      return MoviesModel.fromJson(jsonString);
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Server taking longer time then usual', _base_url.toString());
    }
  }

  //! GETTING A SPECIFIC MOVIE DETAIL ///////////////////////////////////////////
  static Future<MovieDetailsModel> getMovie(int id) async {
    print(id);
    String videoEndpoint = 'movie/$id/videos?';
    String type = '&append_to_response=videos';
    var _uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/$id/videos?api_key=119fea29ff8649b7d4d8c9efdcccfdf9&append_to_response=videos');

    try {
      var response = await http
          .get(
            _uri,
          )
          .timeout(const Duration(seconds: time_out_duration));

      print(response.body);
      return _processResponse(response, true);
    } on SocketException {
      throw FetchDataException('No Internet connection', _base_url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Server taking longer time then usual', _base_url.toString());
    }
  }
}

dynamic _processResponse(http.Response response, bool movieDetails) {
  switch (response.statusCode) {
    case 200:
      var jsonString = jsonDecode(response.body);

      return movieDetails
          ? MovieDetailsModel.fromJson(jsonString)
          : MoviesModel.fromJson(jsonString);
      // ignore: dead_code
      break;
    case 201:
      var jsonString = jsonDecode(response.body);
      return movieDetails
          ? MovieDetailsModel.fromJson(jsonString)
          : MoviesModel.fromJson(jsonString);
      // ignore: dead_code
      break;
    case 400:
      throw BadRequestException(
          utf8.decode(response.bodyBytes), response.request!.url.toString());
    case 401:
    case 403:
      throw UnAuthorizedException(
          utf8.decode(response.bodyBytes), response.request!.url.toString());
    case 422:
      throw BadRequestException(
          utf8.decode(response.bodyBytes), response.request!.url.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured with code : ${response.statusCode}',
          response.request!.url.toString());
  }
}
