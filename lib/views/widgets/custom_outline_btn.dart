import 'package:flutter/material.dart';
import 'package:movie_db/constants/styles.dart';

class CustomOutlineBtn extends StatelessWidget {
  final String btnText;
  VoidCallback onPressed;
  final double horizentalPadding;
  final double verticalPadding;
  final double fontsize;
  final Color color;
  final double borderRadius;
  final bool isWating;
  final bool isFillButton;

  CustomOutlineBtn({
    Key? key,
    required this.btnText,
    required this.onPressed,
    this.verticalPadding = 17,
    this.horizentalPadding = 45,
    this.fontsize = 20,
    required this.color,
    this.borderRadius = 30,
    this.isWating = false,
    this.isFillButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: MaterialButton(
          color: isFillButton ? color : null,
          hoverColor: Styles.blue_button_color.withAlpha(150),
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding, horizontal: horizentalPadding),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: color)),
          onPressed: onPressed,
          child: isWating
              ? SizedBox(
                  height: 23,
                  width: 23,
                  child: CircularProgressIndicator(
                    color: color,
                  ),
                )
              : Text(
                  btnText,
                  style: TextStyle(fontSize: fontsize, color: Colors.white),
                )),
    );
  }
}
