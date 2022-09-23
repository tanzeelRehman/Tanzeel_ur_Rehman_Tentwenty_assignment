import 'package:flutter/material.dart';

import 'package:movie_db/constants/styles.dart';

class CustomHallButton extends StatefulWidget {
  bool isActive;
  CustomHallButton({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  State<CustomHallButton> createState() => _CustomHallButtonState();
}

class _CustomHallButtonState extends State<CustomHallButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isActive = !widget.isActive;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(
                "12:20",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text("  Cinetech + Hall 1",
                  style: TextStyle(color: Colors.grey, fontSize: 20)),
            ]),
            SizedBox(
              height: 13,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Styles.simple_lightBg_color,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                    color: widget.isActive
                        ? Styles.blue_button_color
                        : Colors.transparent,
                    width: 5,
                  )),
              height: 200,
              width: 300,
            ),
            SizedBox(
              height: 13,
            ),
            Row(children: [
              Text(
                "From 50",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text("  or 2500 Bonous",
                  style: TextStyle(color: Colors.grey, fontSize: 20)),
            ]),
          ],
        ),
      ),
    );
  }
}
