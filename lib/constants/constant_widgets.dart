import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/Models/custom_date_button.dart';
import 'package:movie_db/views/widgets/custom_hall_button.dart';
import 'package:movie_db/views/widgets/custom_seat.dart';

class ConstantWidgets {
  static List<BottomNavigationBarItem> bottom_bar_items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      label: "Dashbord",
    ),
    BottomNavigationBarItem(icon: Icon(Icons.video_collection), label: "Watch"),
    BottomNavigationBarItem(
        icon: Icon(Icons.library_books), label: "Media Library"),
    const BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
  ];

  static List<CustomDateButton> movie_dates = [
    CustomDateButton(date: "5", month: "March", active: true),
    CustomDateButton(date: "6", month: "March", active: false),
    CustomDateButton(date: "7", month: "March", active: false),
    CustomDateButton(date: "8", month: "March", active: false),
    CustomDateButton(date: "9", month: "March", active: false),
  ];
  static List<CustomHallButton> hall_list = [
    CustomHallButton(isActive: true),
    CustomHallButton(isActive: false),
    CustomHallButton(isActive: false),
    CustomHallButton(isActive: false),
    CustomHallButton(isActive: false),
    CustomHallButton(isActive: false),
  ];

  static List<Widget> row1seats = [
    Text(
      "1",
      style: TextStyle(fontSize: 15, color: Colors.black),
    ),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: true),
    CustomSeat(simple: true, isActive: true),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
  ];
  static List<Widget> row2seats = [
    Text(
      "2",
      style: TextStyle(fontSize: 15, color: Colors.black),
    ),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: true),
    CustomSeat(simple: true, isActive: true),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
  ];
  static List<Widget> row3seats = [
    Text(
      "3",
      style: TextStyle(fontSize: 15, color: Colors.black),
    ),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: true),
    CustomSeat(simple: true, isActive: true),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
  ];
  static List<Widget> row4seats = [
    Text(
      "4",
      style: TextStyle(fontSize: 15, color: Colors.black),
    ),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: true),
    CustomSeat(simple: true, isActive: true),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
  ];
  static List<Widget> row5seats = [
    Text(
      "5",
      style: TextStyle(fontSize: 15, color: Colors.black),
    ),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: true),
    CustomSeat(simple: true, isActive: true),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
    CustomSeat(simple: true, isActive: false),
  ];
}
