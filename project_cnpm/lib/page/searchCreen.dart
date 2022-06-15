import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'componentSearch/body.dart';
class SearchCreen extends StatelessWidget {
  const SearchCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),

    );
  }

  buildAppBar() {
    return AppBar(
      backgroundColor: Colors.lightGreenAccent,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("menu.svg"),
        onPressed: () {},
      ),
    );
  }
}
