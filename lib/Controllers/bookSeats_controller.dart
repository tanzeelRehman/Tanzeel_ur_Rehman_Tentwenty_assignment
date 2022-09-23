import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookSeatsController extends GetxController {
  var bookSeats = 10.obs;

  incrementBookSeats() {
    bookSeats.value++;
  }
}
