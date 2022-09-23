import 'package:get/get.dart';
import 'package:movie_db/Base/BaseClient.dart';
import 'package:movie_db/Models/movie_details_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailController extends GetxController {
  var movieDetail = <Results>[];
  late Results officialTraillerClip;
  late YoutubePlayerController youtube_controller;

  var dataLoaded = false.obs;
  var showtrailer = false.obs;

  Future<void> getMoviedetails(int movieId) async {
    var movie = await BaseClientService.getMovie(movieId);
    movieDetail = movie.results;
    officialTraillerClip = movieDetail.firstWhere(
      (element) => element.type == 'Trailer',
    );
    youtube_controller = YoutubePlayerController(
      initialVideoId: officialTraillerClip.key,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    dataLoaded.value = true;
    print(officialTraillerClip.id);

    //  print(url.key);

    // moviesList.value = movies.results;
    // print(moviesList.value[1].overview);
  }
}
