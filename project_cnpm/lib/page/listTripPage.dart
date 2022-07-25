import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/DAO/Tickets.dart';
import 'package:project_cnpm/DAO/Trips.dart';
import 'package:project_cnpm/page/search_page.dart';

import '../widget/item_Ticket.dart';
import 'TicketBook.dart';
class ListTrip extends StatefulWidget {
  ListTrip({Key? key, required this.diemBatDau, required this.diemKetThuc,required this.date}) : super(key: key);
  String? diemBatDau;
  String? diemKetThuc;
  String date;


  @override
  State<ListTrip> createState() => _ListTripState(diemBatDau!, diemKetThuc!,date);
}

class _ListTripState extends State<ListTrip> {
  _ListTripState(this.diemBatDau, this.diemKetThuc, this.date);
  String diemBatDau;
  String diemKetThuc;
  String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  image: DecorationImage(
                    image: AssetImage('bus.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 50,
                          child: FlatButton(
                              onPressed: ()=>{
                                Navigator.push(
                                    this.context,
                                    MaterialPageRoute(
                                      builder: (context) => SearchScreen(),))
                              }
                              , child: Container(
                              width: 50,
                              child: Icon(Icons.keyboard_backspace, color: Colors.black,size: 25))),
                        ),

                        Text('$diemBatDau', style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold)),
                        // SizedBox(width: 10),
                        Icon(Icons.swap_horiz,color: Colors.black,size: 25),
                        SizedBox(width: 10),
                        Text("$diemKetThuc",
                            style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold)),


                      ],
                    ),
                    SizedBox(height: 13),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("$date",
                            style: TextStyle(color: Colors.black,fontSize: 15)),
                        Text("1 Adult - Economy",
                            style: TextStyle(color: Colors.black,fontSize: 15))
                      ],
                    )
                  ],
                ),
              ),

              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  decoration: BoxDecoration(
                      color: Color(0xFFFf6f5fb),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                      )
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height-100,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('$count Search Result',
                              style: TextStyle(fontSize: 20)),
                          Icon(Icons.filter_list, color: Colors.black,size: 25)
                        ],
                      ),

                      SizedBox(height: 15),

                      Container(
                        height: 380,
                        child: StreamBuilder<Iterable<Trips>>(
                          stream: readTrips(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final trips = snapshot.data!;
                              return ListView(
                                children: trips.map(buildItemTrip).toList(),

                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )

            ],
          ),

        ),
      ),
    );
  }
  bool isSelect = false;
  int _count=0;


  int get count => _count;


  set count(int value) {
    _count = value;
  }

  Widget buildItemTrip(Trips trip){
    int count1= 0;
    if((diemBatDau==trip.startAddress)&& (diemKetThuc==trip.endAddress)&&(date== trip.date)){
      count1++;
      return  Padding(
        padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24))
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('${trip.startAddress.substring(0,3).toUpperCase()}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.indigo),),
                      SizedBox(width: 16,),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.indigo.shade50,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: SizedBox(
                          height: 8,
                          width: 8,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.indigo.shade400,
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: <Widget>[
                              SizedBox(
                                height: 24,
                                child: LayoutBuilder(builder: (context,constraints){
                                  return Flex(
                                    children: List.generate((constraints.constrainWidth()/6).floor(), (index) =>
                                        SizedBox(height: 1,width: 3,child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey.shade300),),)
                                    ),
                                    direction: Axis.horizontal,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  );
                                },),
                              ),
                              Center(child: Transform.rotate(angle: 1.5,child: Icon(Icons.local_airport,color: Colors.indigo.shade300,size: 24,),))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.pink.shade50,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: SizedBox(
                          height: 8,
                          width: 8,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.pink.shade400,
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16,),
                      Text('${trip.endAddress.substring(0,3).toUpperCase()}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.pink),)
                    ],
                  ),
                  SizedBox(height: 4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(width:100,child: Text('${trip.startAddress}',style: TextStyle(fontSize: 12,color: Colors.grey),)),
                      // Text("6H 30M",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black),),
                      SizedBox(width:100,child: Text('${trip.endAddress}',textAlign: TextAlign.end,style: TextStyle(fontSize: 12,color: Colors.grey),)),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('${trip.startTime}',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                      Text('${trip.endTime}',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('${trip.date}',style: TextStyle(fontSize: 12,color: Colors.grey),),
                      Row(
                        children: <Widget>[
                          Text("Flight No : ",style: TextStyle(fontSize: 12,color: Colors.grey),),
                          Text('${trip.quantityStatus}',style: TextStyle(fontSize: 12,fontWeight:FontWeight.bold,color: Colors.black),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                          color: Colors.grey.shade200
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LayoutBuilder(builder: (context,constraints){
                        return Flex(
                          children: List.generate((constraints.constrainWidth()/10).floor(), (index) =>
                              SizedBox(height: 1,width: 5,child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey.shade400),),)
                          ),
                          direction: Axis.horizontal,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        );
                      },),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                          color: Colors.grey.shade200
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left:16,right:16,bottom: 12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24))
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    padding:EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Icon(Icons.flight_land,color:Colors.amber),
                  ),
                  SizedBox(width: 16,),
                  Text('${trip.startAddress.substring(0,3)}- ${trip.endAddress.substring(0,3)}',style:TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                        child: FlatButton(
                            onPressed: ()=>{
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  TicketBook(trip.idTrip))),
                            },
                            child: Text("Đặt vé",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),)),
                        // child: Text("Đặt vé",
                        // textAlign: TextAlign.center,
                        // style: TextStyle(
                        //   fontSize: 18,
                        //   color: Colors.white,
                        // ),
                        // ),
                      ),

                    ),
                  ),

                  Expanded(child: Text('${trip.price}VNĐ',textAlign: TextAlign.end,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black))),
                ],
              ),
            ),
          ],
        ),
      );}
    return Text("");
  }

  Stream<Iterable<Trips>> readTrips() => FirebaseFirestore.instance
      .collection('trips')
      .snapshots()
      .map((event) => event.docs.map((doc) => Trips.fromJson(doc.data())));




}

