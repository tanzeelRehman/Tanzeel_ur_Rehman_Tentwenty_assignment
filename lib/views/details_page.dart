import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_db/Controllers/movie_detail_controller.dart';

import 'package:movie_db/Models/movies_model.dart';
import 'package:movie_db/constants/assets.dart';
import 'package:movie_db/constants/styles.dart';
import 'package:movie_db/views/book_seat_page.dart';
import 'package:movie_db/views/widgets/custom_fill_button.dart';
import 'package:movie_db/views/widgets/custom_outline_btn.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsPage extends StatefulWidget {
  Results movie;

  MovieDetailController movieDetailController =
      Get.put(MovieDetailController());
  DetailsPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    widget.movieDetailController.getMoviedetails(widget.movie.id);

    //widget.movieDetailController.showtrailer.value = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    String _base_url = 'https://image.tmdb.org/t/p/w500/';
    String _image_url = widget.movie.backdropPath ??
        "https://in.pinterest.com/pin/864550459719526011/";

    return Scaffold(
        body: Container(
      child: Obx(
        () => !widget.movieDetailController.dataLoaded.value
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.movieDetailController.showtrailer.value
                      ? YoutubePlayer(
                          onEnded: (val) {
                            widget.movieDetailController.showtrailer.value =
                                true;
                          },
                          controller:
                              widget.movieDetailController.youtube_controller)
                      : Stack(
                          children: [
                            Image(
                                height: 450,
                                fit: BoxFit.cover,
                                image: NetworkImage(_base_url + _image_url)),
                            Container(
                              height: 450,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [0, 1],
                                    colors: [
                                      Colors.black.withOpacity(0),
                                      Colors.black
                                    ],
                                  )),
                            ),
                            Positioned(
                              top: 40,
                              child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.arrow_back_ios_new_outlined),
                                color: Colors.white,
                              ),
                            ),
                            const Positioned(
                              top: 220,
                              left: 60,
                              child: Text("In Threater December 22,2021 ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                            Positioned(
                                top: 270,
                                left: 70,
                                child: CustomFillButton(
                                    height: 55,
                                    width: 250,
                                    txt: "Get Tickets",
                                    onPressed: () {
                                      Get.to(() => BookSeat());
                                    })),
                            Positioned(
                                top: 340,
                                left: 60,
                                height: 55,
                                width: 270,
                                child: CustomOutlineBtn(
                                    borderRadius: 15,
                                    btnText: "Watch Trailler",
                                    onPressed: () {
                                      widget.movieDetailController.showtrailer
                                          .value = true;
                                    },
                                    color: Styles.blue_button_color)),
                          ],
                        ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Genres",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                        Row(
                          children: [
                            genraChip("Action", Styles.green_color),
                            genraChip("Thriller", Styles.pink_color),
                            genraChip("Science", Styles.acent_color),
                            genraChip("Fiction", Styles.yellow_color),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text("Overview",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 15,
                        ),
                        Text(widget.movie.overview,
                            style: TextStyle(
                                color: Styles.lightTxt_color, fontSize: 15)),
                      ],
                    ),
                  )
                ],
              ),
      ),
    ));
  }

  Widget genraChip(String label, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Chip(
        backgroundColor: color,
        label: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
