import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/DAO/Tickets.dart';
import 'package:project_cnpm/DAO/Users.dart';

import '../page/TicketBook.dart';
import '../page/search_Page/recomend.dart';
import '../page/utils.dart';

class TicketBook_item extends StatelessWidget {
  late String title;
  late String status;
  final String idTicket;
  late Color color = Colors.green;
  late Color color1 = Colors.redAccent;
  TicketBook_item(this.title, this.status, this.idTicket);

  @override
  Widget build(BuildContext context) {
    if (status == "Đã đặt") {
      color = Colors.black26;
    }
    if (status == "Đã chọn") {
      color = Colors.redAccent;
      color1 = Colors.green;
    }

    return Container(
      child: ElevatedButton(
          onPressed: () {
            if (status == 'Trống') {
              updateTicket(idTicket, 'Đã chọn');
            }
            if (status == 'Đã chọn') {
              updateTicket(idTicket, 'Trống');
            }
            RecomendPlantCard.addSeat();
          },
          style: ButtonStyle(
            backgroundColor: getColor(color, color1),
            side: getBorder(Colors.black12, color),
          ),
          child: Text('$title \n$status')),
    );
  }

  late bool isSelect = true;
  Future updateTicket(String idTicket, String status) async {
    final docTicket =
        FirebaseFirestore.instance.collection('tickets').doc(idTicket);
    final snapshot = await docTicket.get();
    Tickets ticket = Tickets.fromJson(snapshot.data()!);
    ticket.updateStatus(status);
    try {
      await docTicket.update(ticket.toJson());
    } on FirebaseException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
  }

  MaterialStateProperty<Color> getColor(Color color, Color color1) {
    final getColor = (Set<MaterialState> state) {
      if ((state.contains(MaterialState.pressed)) & (status != 'Đã đặt')) {
        return color;
      } else {
        return color;
      }
    };
    return MaterialStateProperty.resolveWith((getColor));
  }
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
