import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_cnpm/DAO/Trips.dart';
import 'package:project_cnpm/page/TicketBook.dart';

import '../DAO/Users.dart';
import '../widget/navigation_drawer.dart';

class CheckoutTicket extends StatelessWidget {
  final String idTrips;
   CheckoutTicket(this.idTrips);
   late int seatCount=0;
  @override
  Widget build(BuildContext context) {
    seatCount=TicketBook.listId.length;
    Color primaryColor = Color.fromARGB(255, 248, 178, 29);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Thông tin vé đặt",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
          ],
        ),
        backgroundColor: primaryColor,
      ),
      body: Stack(
        children: [
          Positioned(
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(color: primaryColor),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.grey[50],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            top: 5,
            bottom: 16,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      height: 1000,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      child:FutureBuilder<Trips?>(
                          future: readTrips(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError){
                              return Text('Something went wrong!');
                            }else if (snapshot.hasData){
                              final trip = snapshot.data;
                              final startTime = trip!.startTime;
                              final endTime = trip.endTime;
                              final date = trip.date;
                              final endAddress = trip.endAddress;
                              final startAddress = trip.startAddress;
                              final idDetail =trip.idTrip;
                              final int price = trip.price*seatCount;
                              return trip == null
                                  ? Center(child: Text('No Detail'))
                                  :  ListView(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${startAddress}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 0),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Divider(
                                                        color: primaryColor,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Divider(
                                                        color: primaryColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        "${endAddress}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Bến xe Miền tây"),
                                        Text("Bến xe Miền đông"),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${startTime}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text("${date}")
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "${endTime}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text("${date}")
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    child: FutureBuilder<Users?>(
                                        future: readUser(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError){
                                            return Text('Something went wrong!');
                                          }else if (snapshot.hasData){
                                            final user = snapshot.data;
                                            final names = user!.name;
                                            final phone = user.phone;
                                            return user == null
                                                ? Center(child: Text('No User'))
                                                : Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${names}",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text("Khách hàng")
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "${phone}",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text("Số điện thoại")
                                                  ],
                                                )
                                              ],
                                            );
                                          } else {
                                            return Center(child: CircularProgressIndicator());
                                          }
                                        }
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${seatCount}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text("Số ghế")
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${TicketBook.listId.toString()}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text("Vị trí ghế ngồi")
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${date}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text("Ngày khởi hành")
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${idDetail}DETAIL",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text("Mã đặt vé")
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Trống",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text("Ghi chú")
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${price}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text("Tổng tiền thanh toán")
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          }
                      ),

                    ),
                  ),
                ),
              //  SizedBox(height: 50,),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 40,),
                        SizedBox(width: 40,),
                        SizedBox(width: 40,),
                        SizedBox(width: 40,),
                        FlatButton(
                          child: Text("Hủy vé", style: TextStyle(fontSize: 18.0,
                              fontWeight: FontWeight.bold),),
                          padding: EdgeInsets.all(20),
                          color: Colors.red,
                          textColor: Colors.white,
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
                                        showDialog(
                                            context: context,
                                            builder: (context)=>AlertDialog(
                                              title: const Text("Thông báo"),
                                              content: const Text("Vé đã được hủy."),
                                              actions: [
                                                TextButton(child: const Text("Ok"),
                                                  onPressed: (){
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
                        ),
                        FlatButton(
                          padding: EdgeInsets.all(20),
                          child: Text("Thanh toán", style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                          color: Color.fromARGB(255, 248, 178, 29),
                          textColor: Colors.white,
                          onPressed: () {},
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 240,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: primaryColor,
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: primaryColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
   Future<Users?> readUser() async {
     final id = FirebaseAuth.instance.currentUser;
     final docUser = FirebaseFirestore.instance.collection('users').doc(id!.email);
     final snapshot = await docUser.get();
     if(snapshot.exists){
       return Users.fromJson(snapshot.data()!);
     }
   }
  Future<Trips?> readTrips() async {
    final docUser = FirebaseFirestore.instance.collection('trips').doc(idTrips);
    final snapshot = await docUser.get();
    if(snapshot.exists){
      return Trips.fromJson(snapshot.data()!);
    }
  }
}
