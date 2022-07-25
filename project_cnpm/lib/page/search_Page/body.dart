import 'package:flutter/material.dart';
import 'package:project_cnpm/page/search_Page/recomend.dart';
import 'package:project_cnpm/page/search_Page/titleWithMore.dart';

import 'featured.dart';
import 'hearderForSearch.dart';


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
          Header(size: size),
          TitleWithMoreBtn(title: "Tuyến phổ biến", press: () {}),
          ListTripHOT(),
          TitleWithMoreBtn(title: "Điểm đến phổ biến", press: () {}),
          FeaturedPlants(),

        ],
      ),
    );
  }
}
