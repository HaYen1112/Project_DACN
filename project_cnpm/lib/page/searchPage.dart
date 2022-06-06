// ignore_for_file: prefer_const_constructors, prefer_final_fields

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selected =0;

  void onChanged(int value){
    setState((){
      _selected = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Icon(Icons.person),
          )
       ],
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: ''
      //       ,),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: ''
      //       ,),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications),
      //       label: ''
      //       ,)
      //   ],
      // ),
      body: Column(
          children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
        //   child:  Text("data",
        //     style: TextStyle (
        //       backgroundColor: Colors.green,
        //         fontSize: 36
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, bottom: 5),
          child:  Container(
            width: 360,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),

            ),
            child: Row(
              children:<Widget> [
                Radio(value: 1, groupValue: _selected, onChanged: (int? value) { onChanged(value!);},),
                Text("Mot Chieu"),
                Radio(value: 1, groupValue: _selected, onChanged: (int? value) {onChanged(value!);  },),
                Text("Khu Hoi"),
              ],
            ),

          ),
        ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Text("Diem Di",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 5, bottom: 5, right: 25),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Text("Diem Den",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
            ),
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 5, bottom: 5, right: 25),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder()
            ),
          ),
        ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 25, right: 25.0),
              child: Text("Ngay Di",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 5, bottom: 5, right: 25),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 25, right: 25.0),
              child: Text("Ngay Ve",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 5, bottom: 5, right: 25),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder()
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 250),
            child: Row(
              children: [
                Icon(Icons.search),
                FlatButton(
                  onPressed: () {  },
                  child: Text("Tim Kiem", style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),),
              ],
            ),
          )
          ],

      ),
    );
  }
}
