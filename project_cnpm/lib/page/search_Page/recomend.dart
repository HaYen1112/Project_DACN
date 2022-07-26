import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/DAO/Trips.dart';

import '../../DAO/Tickets.dart';
import '../TicketBook.dart';
import '../login_register_forgotpassword/utils.dart';
import 'constants.dart';



class ListTripHOT extends StatefulWidget {
  const ListTripHOT({Key? key}) : super(key: key);

  @override
  State<ListTripHOT> createState() => _ListTripHOTState();
}

class _ListTripHOTState extends State<ListTripHOT> {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: StreamBuilder<Iterable<Trips>>(
        stream: readTrips(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final trips = snapshot.data!;
            return Row(
              children: trips.map(buildItemTrip).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  Widget buildItemTrip(Trips trip){
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: 200,
      child: Column(
        children: <Widget>[
          Image.asset('nhatrang.jpg'),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  TicketBook('KjH86emQrhP5vwjtjG4u')));
            },
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Column(
                    children: [
                    Container(
                      height: 20,
                      width: 100,
                      child: Text('${trip.startAddress}'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                       ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                      Container(
                        height: 20,
                        width: 100,
                        child: Text('${trip.endAddress}'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.left,

                        ),
                      ),
                    ],
                  ),

                  Text(
       
                    '${trip.price} VNĐ',

                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.red),
                    textAlign: TextAlign.end,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Stream<Iterable<Trips>> readTrips() => FirebaseFirestore.instance
      .collection('trips')
      .snapshots()
      .map((event) => event.docs.map((doc) => Trips.fromJson(doc.data())));


}

