import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Styles {
  static Color acent_color = Color(0xff2E2739);
  static Color blue_button_color = Color(0xff61C3F2);
  static Color green_color = Color(0xff15D2BC);
  static Color pink_color = Color(0xffE26CA5);
  static Color yellow_color = Color(0xffCD9D0F);
  static Color lightTxt_color = Color(0xff827D88);
  static Color lightBg_color = Color(0xffDBDBDF);
  static Color simple_lightBg_color = Color(0xffF6F6FA);

  static Decoration bottom_bar_decoration = BoxDecoration(
    color: acent_color,
    borderRadius: const BorderRadius.only(
        topRight: Radius.circular(30), topLeft: Radius.circular(30)),
  );

  static TextStyle subheading_style =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 25);
}
