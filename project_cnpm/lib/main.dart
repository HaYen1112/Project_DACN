// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:project_cnpm/page/registration_page.dart';
import 'package:project_cnpm/page/searchCreen.dart';


import 'package:project_cnpm/widget/navigation_drawer.dart';
import 'package:project_cnpm/widget/navigation_manage_drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_cnpm/page/login.dart';


void main() async{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  static const appTitle = 'TicketBook';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: SearchCreen(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
    _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage>{
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text(NavigationDrawerWidget.appTitle),
      backgroundColor: Color.fromARGB(255, 248, 178, 29),
    ),
  );
}
