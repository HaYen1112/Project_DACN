import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/page/manager_trips/add_trip_manager.dart';
import 'package:project_cnpm/page/view_ticketbook.dart';
import 'package:project_cnpm/widget/navigation_manage_drawer.dart';

import '../../DAO/Trips.dart';
import 'edit_trip_manager.dart';

class managerTrip extends StatefulWidget {
  @override
  _managerTripState createState() => _managerTripState();
}

class _managerTripState extends State<managerTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationManageDrawerWidget(),
      appBar: AppBar(
        title: Text('Quản lý chuyến đi'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 248, 178, 29),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.white,
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTrip()))
        },
      ),
// đọc dữ liệu chuyến đi thành danh sách
      body: StreamBuilder<Iterable<Trips>>(
        stream: readTrips(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final trips = snapshot.data!;
            return ListView(
              // xuất ra danh sách chuyến đi
              children: trips.map(buildTrip).toList(),
            );
          } else {
            // hiển thị (xuay tròn)
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  bool isSelect = false;
  // 1 chuyến đi
  Widget buildTrip(Trips trip) => ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.amberAccent,
          child: Icon(
            Icons.car_repair,
            color: Colors.white,
          ),
        ),
        title: Text(
          '${trip.startAddress} - ${trip.endAddress}',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text('Ngày khởi hành: ${trip.date}',
                style: TextStyle(color: Colors.black)),
            const SizedBox(
              height: 5,
            ),
            Text('Thời gian khởi hành: ${trip.startTime}',
                style: TextStyle(color: Colors.black)),
            SizedBox(height: 5),
            Text('Giá vé: ${trip.price} Đồng',
                style: TextStyle(color: Colors.black)),
            SizedBox(height: 5),
            Text('Số lượng vé: ${trip.quantityStatus}',
                style: TextStyle(color: Colors.black)),
            SizedBox(height: 20),
          ],
        ),
        // nút edit
        trailing: ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditTrip(
                                amountTicket: trip.quantityStatus,
                                country_id1: trip.startAddress,
                                country_id2: trip.endAddress,
                                endT: trip.endTime,
                                priceTicket: trip.price,
                                startT: trip.startTime,
                                idTrip: trip.idTrip,
                                timeE: TimeOfDay(
                                  hour: int.parse(trip.endTime.substring(0, 2)),
                                  minute: int.parse(trip.endTime.substring(3)),
                                ),
                                timeS: TimeOfDay(
                                  hour:
                                      int.parse(trip.startTime.substring(0, 2)),
                                  minute:
                                      int.parse(trip.startTime.substring(3)),
                                ),
                                date: DateTime(
                                    int.parse(trip.date.substring(6)),
                                    int.parse(trip.date.substring(3, 5)),
                                    int.parse(trip.date.substring(0, 2))),
                              ))),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.amberAccent,
                  )),
        onTap: () {},
        hoverColor: Colors.black12,
        dense: true,
      );

  Stream<Iterable<Trips>> readTrips() => FirebaseFirestore.instance
      .collection('trips')
      .snapshots()
      .map((event) => event.docs.map((doc) => Trips.fromJson(doc.data())));



}
