import 'package:flutter/material.dart';
import 'package:project_cnpm/page/search_Page/recomend.dart';
import 'package:project_cnpm/page/search_Page/titleWithMore.dart';

import 'featured.dart';
import 'header.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
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
