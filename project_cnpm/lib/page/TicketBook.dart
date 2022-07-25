

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
  TicketBook(this.idTrip, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CheckoutTicket.addSeat(idTrip);
    Color primaryColor = Color.fromARGB(255, 248, 178, 29);
    return Scaffold(
      drawer: NavigationManageDrawerWidget(),
      appBar: AppBar(
        title: Text('Đặt vé'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 248, 178, 29),
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
            bottom: 40,
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        child: GridView(
                          padding: const EdgeInsets.all(25),
                          children: [
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
                                          : TicketBook_item(ticket.seatLocation,
                                              ticket.status, "$idTrip$i");
                                    } else {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                  }),
                          ],
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 20),
                        )),
                  ),
                ),
                //  SizedBox(height: 50,),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black26,
                            ),
                            child: Text(
                              'Đã đặt',
                              style: TextStyle(
                                  fontSize: 9, fontWeight: FontWeight.bold),
                            )),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            child: Text(
                              'Trống',
                              style: TextStyle(
                                  fontSize: 9, fontWeight: FontWeight.bold),
                            )),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                            ),
                            child: Text(
                              'Đã chọn',
                              style: TextStyle(
                                  fontSize: 9, fontWeight: FontWeight.bold),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              if (CheckoutTicket.listId.length == 0) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: const Text("Thông báo"),
                                          content: const Text(
                                              "Bạn chưa chọn vị trí ngồi.\nHãy chọn một vị trí bạn muốn!"),
                                          actions: [
                                            TextButton(
                                              child: const Text("Ok"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        ));
                              } else {
                                CheckoutTicket.addSeat(idTrip);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CheckoutTicket(idTrip)));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Text(
                              "Đặt vé",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold,),
                              textAlign: TextAlign.center,
                            ))
                        ),
                        SizedBox(
                          width: 20,
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
