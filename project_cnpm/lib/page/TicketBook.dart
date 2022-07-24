<<<<<<< HEAD
=======

import 'dart:html';
>>>>>>> 5981f3d749dda354493fe34ad2974f9b654254c0

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/DAO/TicketBook_item.dart';
import 'package:project_cnpm/DAO/Tickets.dart';
import 'package:project_cnpm/page/search_Page/recomend.dart';
import 'package:project_cnpm/page/ticket_detail.dart';
import 'package:project_cnpm/widget/navigation_manage_drawer.dart';

class TicketBook extends StatelessWidget {
  final String idTrip;
  late String statuss = '';
  TicketBook(this.idTrip);
  @override
  Widget build(BuildContext context) {
    RecomendPlantCard.addSeat();
    return Scaffold(
        drawer: NavigationManageDrawerWidget(),
        appBar: AppBar(
          title: Text('Đặt vé'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 248, 178, 29),
        ),
        body: GridView(
          padding: const EdgeInsets.all(25),
          children: [
            Text(''),
            Text(''),
            FlatButton(
              // padding: EdgeInsets.all(20),
              child: Text("Đặt vé", style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                if(RecomendPlantCard.listId.length==0){
                  showDialog(
                      context: context,
                      builder: (context)=>AlertDialog(
                        title: const Text("Thông báo"),
                        content: const Text("Bạn chưa chọn vị trí ngồi.\nHãy chọn một vị trí bạn muốn!"),
                        actions: [
                          TextButton(child: const Text("Ok"),
                            onPressed: (){Navigator.of(context).pop();
                            },
                          ),
                        ],
                      )
                  );
                }else{
                  RecomendPlantCard.addSeat();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckoutTicket(idTrip)));
                }
              },
            ),
            for (int i = 1; i <= 36; i++)
              StreamBuilder<Tickets>(
                  stream: readTicket("$idTrip$i"),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('');
                    } else if (snapshot.hasData) {
                      final ticket = snapshot.data;
                      return ticket == null
                          ? Center(child: Text('No Trip'))
                          : TicketBook_item(
                          ticket.seatLocation, ticket.status, "$idTrip$i");
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
          ],
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 6 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
        ));
  }


  MaterialStateProperty<Color> getColor(Color color, Color color1) {
    final getColors = (Set<MaterialState> state) {
      if ((state.contains(MaterialState.pressed))) {
        return color1;
      } else {
        return color;
      }
    };
    return MaterialStateProperty.resolveWith((getColors));
  }

  MaterialStateProperty<BorderSide> getBorder(Color color, Color color1) {
    final getBorder = (Set<MaterialState> state) {
      if (state.contains(MaterialState.pressed)) {
        return BorderSide(color: color1, width: 1);
      } else {
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
