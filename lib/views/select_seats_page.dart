import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_db/Controllers/bookSeats_controller.dart';
import 'package:movie_db/constants/constant_widgets.dart';
import 'package:movie_db/constants/styles.dart';
import 'package:movie_db/views/widgets/custom_fill_button.dart';
import 'package:movie_db/views/widgets/painter_screen.dart';

class SelectSeats extends StatelessWidget {
  SelectSeats({Key? key}) : super(key: key);

  BookSeatsController _bookSeatsController = Get.put(BookSeatsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 120,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "The Kings Men",
                        style: Styles.subheading_style,
                      ),
                      Text(
                        "March 5 2021: Hall 1",
                        style: Styles.subheading_style.copyWith(
                            color: Styles.blue_button_color, fontSize: 15),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: Styles.lightBg_color,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      PainterScreenMovie(),
                      Text(
                        "Screen",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: ConstantWidgets.row1seats,
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: ConstantWidgets.row2seats,
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: ConstantWidgets.row3seats,
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: ConstantWidgets.row4seats,
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: ConstantWidgets.row5seats,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Styles.yellow_color,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Selected",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Styles.lightTxt_color,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Not Avalible",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Styles.acent_color,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Selected",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Styles.acent_color,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Selected",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 35),
                  child: Row(
                    children: [
                      CustomFillButton(
                        height: 60,
                        width: 150,
                        txt: "Total Price 50",
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      CustomFillButton(
                        height: 60,
                        width: 200,
                        txt: "Proceed to Pay",
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
