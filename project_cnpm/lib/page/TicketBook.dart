import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/DAO/TicketBook_item.dart';
import 'package:project_cnpm/DAO/TicketData.dart';
import 'package:project_cnpm/DAO/Tickets.dart';
import 'package:project_cnpm/DAO/Users.dart';
import 'package:project_cnpm/widget/navigation_manage_drawer.dart';

import '../DAO/Trips.dart';



class TicketBook extends StatelessWidget {
  final String idTrip;
  late String statuss = '';

  TicketBook(this.idTrip);
  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: NavigationManageDrawerWidget(),
      appBar: AppBar(
        title: Text('Đặt vé'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 248, 178, 29),
      ),
      body:
      GridView(
        padding: const EdgeInsets.all(25),
        children: [
          Text(''),
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

  Stream<Tickets> readTicket(String idTicket) => FirebaseFirestore.instance
      .collection('tickets')
      .doc(idTicket)
      .snapshots()
      .map((event) => Tickets.fromJson(event.data()!));
}
