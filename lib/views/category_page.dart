import 'package:flutter/material.dart';
import 'package:movie_db/constants/assets.dart';
import 'package:movie_db/views/widgets/category_card.dart';
import 'package:movie_db/views/widgets/custom_textfield.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 5),
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          CustomTextfield(
              textAlign: TextAlign.start,
              hinttext: "TV Shows, Movies and More",
              validator: (val) {},
              con: _searchController),
          Expanded(
              child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: List.generate(20, (index) => CategoryCard())))
        ],
      ),
    );
  }
}
