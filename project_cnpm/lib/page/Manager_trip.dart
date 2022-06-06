import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: tripmodel.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return item
                      return ContactItem(
                        tripmodel[index].nameTrip,
                        tripmodel[index].date,
                        tripmodel[index].time,
                        tripmodel[index].isSelected,
                        index,
                      );
                    }),
              ),
              selectedTrip.length > 0 ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.green[700],
                    child: Text(
                      "Delete (${selectedTrip.length})",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      print("Delete List Lenght: ${selectedTrip.length}");
                    },
                  ),
                ),
              ): Container(),
            ],
          ),
        ),
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