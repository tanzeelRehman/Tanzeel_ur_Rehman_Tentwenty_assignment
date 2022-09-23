import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_db/Controllers/bookSeats_controller.dart';
import 'package:movie_db/constants/styles.dart';

class CustomSeat extends StatefulWidget {
  bool simple;
  bool isActive;
  CustomSeat({
    Key? key,
    required this.simple,
    required this.isActive,
  }) : super(key: key);

  @override
  State<CustomSeat> createState() => _CustomSeatState();
}

class _CustomSeatState extends State<CustomSeat> {
  BookSeatsController _bookSeatsController = Get.find<BookSeatsController>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: IconButton(
          color: Colors.blue,
          iconSize: 15,
          onPressed: () {
            setState(() {
              widget.isActive = !widget.isActive;
              _bookSeatsController.incrementBookSeats();
            });
          },
          icon: Icon(
              color: widget.isActive
                  ? widget.simple
                      ? Styles.acent_color
                      : Styles.blue_button_color
                  : Colors.grey,
              Icons.circle)),
    );
  }
}
