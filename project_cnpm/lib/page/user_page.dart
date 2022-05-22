import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/widget/navigation_drawer.dart';
class UserPage extends StatelessWidget{
  final String name;
  final String urlImage;
  const UserPage({
    Key? key,
    required this.name,
    required this.urlImage,
}): super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NaigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Thông tin khách hàng'),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 248, 178, 29),
    ),
    body: Image.network(
      urlImage,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    ),
  );
}