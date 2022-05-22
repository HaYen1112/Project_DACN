import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/widget/navigation_drawer.dart';
class Promotion extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NaigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Khuyến mãi'),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 248, 178, 29),
    ),
  );
}