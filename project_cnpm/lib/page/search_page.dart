import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_cnpm/page/search_Page/body.dart';
import 'package:project_cnpm/page/search_Page/constants.dart';


class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),

    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 0,
      leading: Icon(Icons.menu),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 25.0),
          child: Icon(Icons.person),
        )
      ],
    );
  }
}
