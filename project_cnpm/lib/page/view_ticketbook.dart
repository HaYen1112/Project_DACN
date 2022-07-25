import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/DAO/viewTicketDetail.dart';
import 'package:project_cnpm/widget/navigation_manage_drawer.dart';

import '../DAO/Trips.dart';
import 'Manager_trip_model.dart';
import 'edit_trip_manager.dart';

class ViewTicket extends StatefulWidget {
  @override
  _ViewTicketState createState() => _ViewTicketState();
}

class _ViewTicketState extends State<ViewTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationManageDrawerWidget(),
      appBar: AppBar(
        title: Text('Xem vé đã đặt'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 248, 178, 29),
      ),

      body: StreamBuilder<Iterable<ViewTicketDetail>>(
        stream: readTrips(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final trips = snapshot.data!;
            return ListView(
              children: trips.map(buildTrip).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  bool isSelect = false;
  Widget buildTrip(ViewTicketDetail view) => ListTile(
    leading: const CircleAvatar(
      backgroundColor: Colors.amberAccent,
      child: Icon(
        Icons.car_repair,
        color: Colors.white,
      ),
    ),
    title: Text(
      '${view.startAddress} - ${view.endAddress}',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    ),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text('Mã vé: ${view.idViewTicket}',
            style: TextStyle(color: Colors.black)),
        SizedBox(height: 5),
        Text('Tên hành khách: ${view.nameCus} ',
            style: TextStyle(color: Colors.black)),
        SizedBox(height: 5),
        Text('Số điện thoại: ${view.phone} ',
            style: TextStyle(color: Colors.black)),
        SizedBox(height: 5),
        Text('Ngày khởi hành: ${view.date}',
            style: TextStyle(color: Colors.black)),
        SizedBox(height: 5),
        Text('Thời gian xuất phát: ${view.startTime}',
            style: TextStyle(color: Colors.black)),
        SizedBox(height: 5),
        Text('Thời gian đến: ${view.endTime}',
            style: TextStyle(color: Colors.black)),
        SizedBox(height: 5),
        Text('Ghi chú: ${view.note}',
            style: TextStyle(color: Colors.black)),
        SizedBox(height: 5),
        Text('Tổng tiền thanh toán: ${view.priceTotal} Đồng',
            style: TextStyle(color: Colors.black)),
        SizedBox(height: 5),
        Text('Số lượng vé: ${view.seatTotal}',
            style: TextStyle(color: Colors.black)),
        SizedBox(height: 5),
        Text('Vị trí ghế ngồi: ${view.seatLocation}',
            style: TextStyle(color: Colors.black)),
        SizedBox(height: 5),
      ],
    ),
    trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.all(18.0),
            minimumSize: Size(20.0, 20.0)),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context)=>AlertDialog(
                title: const Text("Xác nhận hủy vé?"),
                content: const Text("Thao tác này sẽ hủy vé đã đặt của bạn."),
                actions: [
                  TextButton(child: const Text("Hủy"),
                    onPressed: (){Navigator.of(context).pop();
                    },
                  ),
                  TextButton(child: const Text("Xác nhận"),
                    onPressed: (){
                      deleteTicket('KXx2g4uUV6V6IlkVk0qs');
                      showDialog(
                          context: context,
                          builder: (context)=>AlertDialog(
                            title: const Text("Thông báo"),
                            content: const Text("Vé đã được hủy."),
                            actions: [
                              TextButton(child: const Text("Ok"),
                                onPressed: (){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => ViewTicket()));
                                },
                              ),
                            ],
                          )
                      );
                    },
                  )
                ],
              )
          );
        },
        child: Icon(
          Icons.delete,
          color: Colors.red,
          size: 25,
        )),
    onTap: () {},
    hoverColor: Colors.black12,
    dense: true,
  );
  Stream<Iterable<ViewTicketDetail>> readTrips() => FirebaseFirestore.instance
      .collection('viewTicketBooked')
      .snapshots()
      .map((event) => event.docs.map((doc) => ViewTicketDetail.fromJson(doc.data())));

  Future deleteTicket(String idViewTicket) async {
    final docTicket=FirebaseFirestore.instance.collection('viewTicketBooked').doc(idViewTicket);
    try {
     await docTicket.delete();
    } on FirebaseException catch (e) {
      // print(e);
      //  Utils.showSnackBar(e.message);
    }
  }

}
