import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:movie_db/Controllers/movies_list_controller.dart';
import 'package:movie_db/constants/styles.dart';
import 'package:movie_db/views/book_seat_page.dart';
import 'package:movie_db/views/details_page.dart';
import 'package:movie_db/views/home_page.dart';
import 'package:movie_db/views/select_seats_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Services/LocalDbService.dart';

void main() async {
  // await Hive.initFlutter();
  // await LocalDbService.openBox('Movie_db');
  Get.put(MoviesListController());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.transparent,
        iconTheme: IconThemeData(color: Styles.blue_button_color),
      ),
      home: HomePage(),
    );
  }
}
