import 'package:flutter/material.dart';
import 'package:movie_db/constants/styles.dart';

class CustomDateButton extends StatefulWidget {
  String date;
  String month;
  bool active;
  CustomDateButton({
    Key? key,
    required this.date,
    required this.month,
    required this.active,
  }) : super(key: key);

  @override
  State<CustomDateButton> createState() => _CustomDateButtonState();
}

class _CustomDateButtonState extends State<CustomDateButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.active = !widget.active;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
            color: widget.active
                ? Styles.blue_button_color
                : Styles.simple_lightBg_color,
            borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Text(
              widget.date,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: widget.active ? Colors.white : Styles.lightTxt_color),
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              widget.month,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: widget.active ? Colors.white : Styles.lightTxt_color),
            ),
          ],
        ),
      ),
    );
  }
}
