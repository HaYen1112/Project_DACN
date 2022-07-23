import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/page/AddTicket.dart';
import 'package:project_cnpm/widget/navigation_manage_drawer.dart';

import '../page/manage_ticket.dart';
import 'Manager_trip_model.dart';

class managerTrip extends StatefulWidget{
  @override
  _managerTripState createState() => _managerTripState();

}

class _managerTripState extends State<managerTrip> {
 List<TripModel> tripmodel = [
   TripModel("Đà Lạt - Tp Hồ Chí Minh", "5/6/2022","10:30 AM", false),
   TripModel("Tp Hồ Chí Minh - Vĩnh Long", "5/6/2022","6:30 AM", false),
   TripModel("Hà Nội - Bình Định", "5/6/2022","7:30 AM", false),
   TripModel("Vĩnh Long - Vũng Tàu", "5/6/2022","8:30 AM", false),
   TripModel("Tp Hồ Chí Minh - Hậu Giang ", "5/6/2022","5:30 PM", false),
   TripModel("Bến tre - Tp Hồ Chí Minh", "5/6/2022","7:00 AM", false),
 ];
 List<TripModel> selectedTrip = [];

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
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: () => {
          TextSpan(
          recognizer: TapGestureRecognizer()
          ..onTap = (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTicket()));
          },
          )
        },
      ),

      body:
      StreamBuilder<Iterable<Trips>>(
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

 Widget ContactItem(
     String nameTrip, String date, String time, bool isSelected, int index) {
   return ListTile(
     leading: CircleAvatar(
       backgroundColor: Colors.green[700],
       child: Icon(
         Icons.person_outline_outlined,
         color: Colors.white,
       ),
     ),
     title: Text(
       nameTrip,
       style: TextStyle(
         fontWeight: FontWeight.w500,
       ),
     ),
     
     subtitle: Text(date),
     trailing: isSelected
         ? Icon(
       Icons.check_circle,
       color: Colors.green[700],
     )
         : Icon(
       Icons.check_circle_outline,
       color: Colors.grey,
     ),

     onTap: () {
       setState(() {
         tripmodel[index].isSelected = !tripmodel[index].isSelected;
         if (tripmodel[index].isSelected == true) {
           selectedTrip.add(TripModel(nameTrip, date, time, true));
         } else if (tripmodel[index].isSelected == false) {
           selectedTrip
               .removeWhere((element) => element.nameTrip == tripmodel[index].nameTrip);
         }
       });
     },
   );
 }
}