
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/DAO/Tickets.dart';
import 'package:project_cnpm/DAO/Trips.dart';
import 'package:project_cnpm/main.dart';
import 'package:project_cnpm/page/utils.dart';
import 'package:project_cnpm/widget/navigation_manage_drawer.dart';
import '../widget/header_widget.dart';
import '../widget/theme_helper.dart';

class AddTrip extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddTripState();
  }
}

class _AddTripState extends State<AddTrip> {
  final _formKey = GlobalKey<FormState>();
  TimeOfDay timeS = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay timeE = TimeOfDay(hour: 0, minute: 0);
  final controllerStartAddress = TextEditingController();
  final controllerEndAddress = TextEditingController();
  final controllerStartTime = TextEditingController();
  final controllerEndTime = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerQuantity = TextEditingController();
  final controllerprice = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  String _country_id1 = "TP Hồ Chí Minh";
  String _country_id2 = "An Giang";
  List<String> country = [
    "TP Hồ Chí Minh",
    "Nha Trang",
    "An Giang",
    "Đà Lạt",
    "Vũng Tàu",
    "Cần Thơ",
    "Huế",
    "Đà Nẵng",
    "Hà Nội",
    "Hà Giang"
  ];
  DateTime date = DateTime(2022, 7, 26);
  String amountOfTime = '';
  @override
  Widget build(BuildContext context) {
    final hoursS = timeS.hour.toString().padLeft(2, '0');
    final minutesS = timeS.minute.toString().padLeft(2, '0');
    final hoursE = timeE.hour.toString().padLeft(2, '0');
    final minutesE = timeE.minute.toString().padLeft(2, '0');
    return Scaffold(
      drawer: NavigationManageDrawerWidget(),
      appBar: AppBar(
        title: Text('Thêm chuyến đi'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 248, 178, 29),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 0,
              child: HeaderWidget(80, false, Icons.car_rental),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Colors.amber,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.car_rental_sharp,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Chọn điểm khởi hành',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: Color(0xffCED0D2), width: 1)),
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            value: _country_id1,
                            isExpanded: true,
                            onChanged: (newValue) {
                              setState(() {
                                this._country_id1 = newValue!;
                              });
                            },
                            items: country.map((newValue) {
                              return DropdownMenuItem(
                                value: newValue,
                                child: Text(newValue),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Chọn điểm kết thúc',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: Color(0xffCED0D2), width: 1)),
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            value: _country_id2,
                            isExpanded: true,
                            hint: Text('Chọn điểm kết thúc'),
                            onChanged: (newValue) {
                              setState(() {
                                this._country_id2 = newValue!;
                              });
                            },
                            items: country.map((newValue) {
                              return DropdownMenuItem(
                                value: newValue,
                                child: Text(newValue),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Thời gian khởi hành',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controllerStartTime,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "$hoursS:$minutesS",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffCED0D2), width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)))),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () async {
                              TimeOfDay? newTimeS = await showTimePicker(
                                  context: context, initialTime: timeS);
                              if (newTimeS == null) return;
                              setState(() {
                                timeS = newTimeS;
                              });
                            },
                            child: Text('Chọn thời gian')),
                        SizedBox(height: 15),
                        Text(
                          'Thời gian kết thúc',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: TextFormField(
                            controller: controllerEndTime,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "$hoursE:$minutesE",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffCED0D2), width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)))),
                            validator: (time) {
                              if (timeS.hour == timeE.hour) {
                                if (timeS.minute > timeE.minute)
                                  return "Chọn thời gian đến phải lớn hơn thời gian đi";
                              } else {
                                if (timeS.hour > timeE.hour)
                                  return "Chọn thời gian đến phải lớn hơn thời gian đi";
                              }
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () async {
                              TimeOfDay? newTimeE = await showTimePicker(
                                  context: context, initialTime: timeE);
                              if (newTimeE == null) return;
                              setState(() {
                                timeE = newTimeE;
                              });
                            },
                            child: Text('Chọn thời gian')),
                        SizedBox(height: 15),
                        Text(
                          'Ngày khởi hành',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: TextFormField(
                            controller: controllerDate,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            decoration: InputDecoration(
                                labelText:
                                    "${date.year}/${date.month}/${date.day}",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffCED0D2), width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)))),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                              );
                              if (newDate == null) return;
                              setState(() {
                                date = newDate;
                              });
                            },
                            child: Text('Chọn ngày')),
                        SizedBox(height: 15),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controllerQuantity,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Số lượng vé",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffCED0D2), width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)))),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controllerprice,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Giá vé",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffCED0D2), width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)))),
                          ),
                        ),
                        Container(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                              child: SizedBox(
                                  width: double.infinity,
                                  height: 52,
                                  child: RaisedButton(
                                    onPressed: () {
                                      if(timeS.minute>timeE.minute){
                                        this.amountOfTime = '${timeE.hour - timeS.hour-1}:${timeE.minute-timeS.minute+60}';
                                      }else{
                                        this.amountOfTime = '${timeE.hour - timeS.hour}:${timeE.minute-timeS.minute}';
                                      }
                                      final trip = Trips(
                                          startTime: "$hoursS:$minutesS",
                                          endTime: "$hoursE:$minutesE",
                                          date:
                                              '${date.day}/${date.month}/${date.year}',
                                          endAddress: this._country_id2,
                                          startAddress: this._country_id1,
                                          price:
                                              int.parse(controllerprice.text),
                                          quantityStatus: int.parse(
                                              controllerQuantity.text));
                                      createTrip(trip, this. amountOfTime);
                                    },
                                    child: Text("Add Trip",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18)),
                                    color: Colors.amber,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6))),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future createTrip(Trips trip, String amount) async {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    final docTrip = FirebaseFirestore.instance.collection('trips').doc();
    final json = trip.toJson();
    String seat ='A';
    try {
      for(int i= 1; i<= 36; i++){
        if (i==19) seat='B';
        final docTicket = FirebaseFirestore.instance.collection('tickets').doc(docTrip.id+"${i}");
        final newTicket = Tickets(
            startTime: trip.startTime,
            endTime: trip.endTime,
            date: trip.date,
            endAddress: trip.endAddress,
            startAddress: trip.startAddress,
            price: trip.price,
            amountOfTime: amount,
            seatLocation: '${seat}${i}',
            status: 'Trống');
        final jsons = newTicket.toJson();
        await docTicket.set(jsons);
      }
      await docTrip.set(json);
    } on FirebaseException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

