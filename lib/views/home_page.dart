import 'package:flutter/material.dart';
import 'package:movie_db/constants/constant_widgets.dart';
import 'package:movie_db/constants/styles.dart';
import 'package:movie_db/views/category_page.dart';
import 'package:movie_db/views/movies_list_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _tabs = [
    Container(child: Center(child: Text("DashbordPage"))),
    MoviesList(),
    Container(child: Center(child: Text("MediaLibraryPage"))),
    Container(child: Center(child: Text("MorePage"))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _tabs[_currentIndex],
      bottomNavigationBar: Container(
          decoration: Styles.bottom_bar_decoration,
          child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              elevation: 0,
              backgroundColor: Colors.transparent,
              items: ConstantWidgets.bottom_bar_items)),
    );
  }
}
