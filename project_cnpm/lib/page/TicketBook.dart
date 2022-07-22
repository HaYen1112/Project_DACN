import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/DAO/TicketBook_item.dart';
import 'package:project_cnpm/DAO/TicketData.dart';
import 'package:project_cnpm/DAO/Tickets.dart';
import 'package:project_cnpm/DAO/Users.dart';
import 'package:project_cnpm/page/ticketDetail.dart';
import 'package:project_cnpm/page/ticket_detail.dart';
import 'package:project_cnpm/widget/navigation_manage_drawer.dart';

import '../DAO/Trips.dart';
import '../widget/navigation_drawer.dart';



class TicketBook extends StatelessWidget {
  final String idTrip;
  late String statuss = '';
  static late List<String> listId = [];
  TicketBook(this.idTrip);
  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Đặt vé'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 248, 178, 29),
      ),
      body:
      GridView(
        padding: const EdgeInsets.all(25),
        children: [
          ElevatedButton(
              onPressed: () {
                print(listId.toString());
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckoutTicket(idTrip) ));
              },
              style: ButtonStyle(
                  backgroundColor: getColor(Colors.redAccent, Colors.amberAccent),
                  side: getBorder(Colors.black12, Colors.redAccent),
              ),

              child: Text('Đặt vé')),
          Text(''),
          for (int i = 0; i <= 36; i++)
            StreamBuilder<Tickets>(
                stream: readTicket("$idTrip$i"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('');
                  } else if (snapshot.hasData) {
                    final ticket = snapshot.data;
                    return ticket == null
                        ? Center(child: Text('No Trip'))
                        : TicketBook_item(ticket.seatLocation, ticket.status);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ));
  MaterialStateProperty<Color> getColor(Color color, Color color1){
    final getColors = (Set<MaterialState> state){
      if ((state.contains(MaterialState.pressed))){
        return color1;
      }else{
        return color;
      }
    };
    return MaterialStateProperty.resolveWith((getColors));
  }
  MaterialStateProperty<BorderSide> getBorder(Color color, Color color1){
    final getBorder = (Set<MaterialState> state){
      if (state.contains(MaterialState.pressed)){
        return BorderSide(color: color1, width: 1);
      }else{
        return BorderSide(color: color, width: 1);
      }
    };
    return MaterialStateProperty.resolveWith((getBorder));
  }
  Stream<Tickets> readTicket(String idTicket) => FirebaseFirestore.instance
      .collection('tickets')
      .doc(idTicket)
      .snapshots()
      .map((event) => Tickets.fromJson(event.data()!));

}