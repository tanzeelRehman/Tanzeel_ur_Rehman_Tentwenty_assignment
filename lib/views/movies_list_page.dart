import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'package:movie_db/Controllers/movies_list_controller.dart';
import 'package:movie_db/Models/movies_model.dart';
import 'package:movie_db/constants/assets.dart';
import 'package:movie_db/views/details_page.dart';
import 'package:movie_db/views/widgets/category_card.dart';
import 'package:movie_db/views/widgets/custom_textfield.dart';

class MoviesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    MoviesListController _moviesListController =
        Get.find<MoviesListController>();
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 5),
      child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          CustomTextfield(
              textFieldIcon: Icon(Icons.search),
              textAlign: TextAlign.start,
              hinttext: "TV Shows, Movies and More",
              onChange: (value) {
                _moviesListController.getMovies(value);
              },
              validator: (val) {},
              con: _searchController),
          Obx(() => Expanded(
              child: ListView.builder(
                  itemCount: _moviesListController.moviesList.isNull
                      ? 0
                      : _moviesListController.moviesList.length,
                  itemBuilder: ((context, index) {
                    String _base_url = 'https://image.tmdb.org/t/p/w500/';
                    String _image_url =
                        _moviesListController.moviesList[index].posterPath ??
                            "https://in.pinterest.com/pin/864550459719526011/";
                    String _title =
                        _moviesListController.moviesList[index].title;

                    return GestureDetector(
                      onTap: () {
                        print("Movie info is");
                        print(_moviesListController.moviesList[index].id);

                        Get.to(() => DetailsPage(
                            movie: _moviesListController.moviesList[index]));
                      },
                      child: Container(
                        height: 150,
                        margin: EdgeInsets.symmetric(vertical: 12),
                        child: Stack(
                          children: [
                            Positioned.fill(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: _moviesListController
                                      .isConnectedToInternet.value
                                  ? Image(
                                      fit: BoxFit.cover,
                                      image:
                                          NetworkImage(_base_url + _image_url))
                                  : Image(image: AssetImage(Assets.funny)),
                            )),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.black.withOpacity(0.7),
                                            Colors.transparent
                                          ]))),
                            ),
                            Positioned(
                                bottom: 0,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(_title,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 25)))),
                          ],
                        ),
                      ),
                    );
                  }))))
        ],
      ),
    );
    ;
  }
}
