import 'package:flutter/material.dart';

import '../../constants/assets.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(image: AssetImage(Assets.funny)),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Positioned(
            top: 110,
            left: 15,
            child: Text(
              "Comedies",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          )
        ],
      ),
      margin: EdgeInsets.all(5.0),
    );
  }
}
