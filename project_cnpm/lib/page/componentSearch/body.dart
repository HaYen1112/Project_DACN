

import 'package:flutter/material.dart';
import 'package:project_cnpm/page/componentSearch/headerOfSearch.dart';
import 'package:project_cnpm/page/componentSearch/recomendsPlants.dart';
import 'package:project_cnpm/page/componentSearch/titleWithMoreButton.dart';

import 'featuredPlants.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Tuyến phổ biến", press: () {}),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "Điểm đến phổ biến", press: () {}),
          FeaturedPlants(),

        ],
      ),
    );
  }
}



