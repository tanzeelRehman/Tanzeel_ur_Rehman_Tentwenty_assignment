import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/constants/styles.dart';

class CustomFillButton extends StatelessWidget {
  final double height;
  final double width;
  final String txt;
  final VoidCallback onPressed;
  const CustomFillButton({
    Key? key,
    required this.height,
    required this.width,
    required this.txt,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Styles.blue_button_color,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
          txt,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        )),
      ),
    );
  }
}
