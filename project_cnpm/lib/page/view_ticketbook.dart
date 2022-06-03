
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/widget/navigation_drawer.dart';
class ViewTicket extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Xem vé đã đặt'),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 248, 178, 29),
    ),
  );
}