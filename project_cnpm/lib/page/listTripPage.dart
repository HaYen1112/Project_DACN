import 'package:flutter/material.dart';

import '../widget/item_Ticket.dart';
class ListTrip extends StatefulWidget {
  const ListTrip({Key? key}) : super(key: key);

  @override
  State<ListTrip> createState() => _ListTripState();
}

class _ListTripState extends State<ListTrip> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                decoration: BoxDecoration(
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
                      children: const <Widget>[
                        Icon(Icons.keyboard_backspace, color: Colors.white,size: 25),
                        SizedBox(width: 20),
                        Text("SFO",
                            style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Icon(Icons.swap_horiz,color: Colors.white,size: 25),
                        SizedBox(width: 10),
                        Text("JFK",
                            style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold)),

                        SizedBox(width: 160),
                        Icon(Icons.build,color: Colors.white,size: 25)
                      ],
                    ),
                    SizedBox(height: 13),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("12 Sep - 15 Sep",
                            style: TextStyle(color: Colors.white,fontSize: 15)),
                        Text("1 Adult - Economy",
                            style: TextStyle(color: Colors.white,fontSize: 15))
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
                  height: 600,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("21 Search Results",
                              style: TextStyle(fontSize: 20)),
                          Icon(Icons.filter_list, color: Colors.black,size: 25)
                        ],
                      ),

                      SizedBox(height: 15),

                      Container(
                        height: 480,
                        child: ListView(
                          children: <Widget>[
                            TicketView(),
                            TicketView(),
                            TicketView(),
                            TicketView(),
                            TicketView(),
                          ],
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
      // appBar: AppBar(
      //   brightness: Brightness.light,
      //   backgroundColor: Colors.white,
      //   title: Text("My Bookings",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
      //   elevation: 1,
      // ),
      // backgroundColor: Colors.grey.shade200,
      // body: ListView.builder(
      //     itemCount:10,
      //     padding: EdgeInsets.only(top: 8,bottom: 8),
      //     itemBuilder: (context,index){
      //       return TicketView();
      //     }),
    );
  }
}
