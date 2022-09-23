import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_db/Models/custom_date_button.dart';
import 'package:movie_db/constants/constant_widgets.dart';
import 'package:movie_db/constants/styles.dart';
import 'package:movie_db/views/select_seats_page.dart';
import 'package:movie_db/views/widgets/custom_fill_button.dart';
import 'package:movie_db/views/widgets/custom_hall_button.dart';

class BookSeat extends StatelessWidget {
  const BookSeat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Container(
              height: 70,
              margin: EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "The Kings Men",
                      style: Styles.subheading_style,
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Styles.lightBg_color,
              height: MediaQuery.of(context).size.height * 0.82,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Date",
                    style: Styles.subheading_style,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: ConstantWidgets.movie_dates,
                      )),
                  SizedBox(
                    height: 45,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: ConstantWidgets.hall_list,
                      )),
                  Expanded(
                    child: Container(),
                  ),
                  CustomFillButton(
                      height: 60,
                      width: 500,
                      txt: "Select Seats",
                      onPressed: (() {
                        Get.to(() => SelectSeats());
                      }))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
