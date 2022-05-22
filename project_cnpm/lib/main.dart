import 'package:flutter/material.dart';
import 'package:project_cnpm/widget/navigation_drawer.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  static const appTitle = 'TicketBook';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MainPage(),
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
    drawer: NaigationDrawerWidget(),
    appBar: AppBar(
      title: Text(MyApp.appTitle),
      backgroundColor: Color.fromARGB(255, 248, 178, 29),
    ),
  );


}
