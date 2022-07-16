
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/page/manage_ticket.dart';
import 'package:project_cnpm/widget/navigation_manage_drawer.dart';

class EditTicketAdmin extends StatelessWidget {
  final controller = TextEditingController();

  List<String> departures = [
    'TP Hồ Chí Minh',
    'Bến Tre',
    'Cần Thơ',
    'Vĩnh Long',
    'Đồng Tháp',
    'Long An',
    'Tiền Giang'
  ];
  List<String> types = ['1 chiều', '2 chiều', 'Hàng ký gởi'];
  List<String> seats = [
    'A01',
    'A02',
    'A03',
    'A04',
    'A05',
    'A06',
    'A07',
    'A08',
    'A09'
  ];
  List<String> prices = [
    '100.000',
    '200.000',
    '300.000',
    '400.000',
    '500.000',
    '600.000',
    '700.000'
  ];

  String? selectedValue = 'TP Hồ Chí Minh';
  String? selectedValue2 = 'Bến Tre';
  String? type = '2 chiều';
  String? seat = 'A01';
  String? price = '100.000';

  // int idTicket = 001;

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationManageDrawerWidget(),
      appBar: AppBar(
        title: Text('Cập nhật vé'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 248, 178, 29),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Mã Vé',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),)))),

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.orangeAccent),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(10))),
                        child: Text("Quay lại",
                            style: TextStyle(
                                color: Colors.white, fontSize: 12, height: 0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ManageTicket()));
                        },
                      )
                    ]),
              ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text("Mã vé: 001",
                  style: TextStyle(fontSize: 14, color: Colors.black))),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Container(
                  child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          labelText: "Điểm khởi hành:",
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0),
                              borderRadius: BorderRadius.circular(15))),
                      value: selectedValue,
                      items: departures
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child:
                                    Text(item, style: TextStyle(fontSize: 18)),
                              ))
                          .toList(),
                      onChanged: (item) => selectedValue = item))),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Container(
                  child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          labelText: "Điểm đến:",
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0),
                              borderRadius: BorderRadius.circular(15))),
                      value: selectedValue2,
                      items: departures
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child:
                                    Text(item, style: TextStyle(fontSize: 18)),
                              ))
                          .toList(),
                      onChanged: (item) => selectedValue2 = item))),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Container(
                  child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          labelText: "Loại vé:",
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0),
                              borderRadius: BorderRadius.circular(15))),
                      value: type,
                      items: types
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child:
                                    Text(item, style: TextStyle(fontSize: 18)),
                              ))
                          .toList(),
                      onChanged: (item) => type = item))),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Container(
                  child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          labelText: "Giá vé:",
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0),
                              borderRadius: BorderRadius.circular(15))),
                      value: price,
                      items: prices
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child:
                                    Text(item, style: TextStyle(fontSize: 18)),
                              ))
                          .toList(),
                      onChanged: (item) => price = item))),

              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Container(
                      child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              labelText: "Số ghế:",
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 0),
                                  borderRadius: BorderRadius.circular(15))),
                          value: seat,
                          items: seats
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item,
                                        style: TextStyle(fontSize: 18)),
                                  ))
                              .toList(),
                          onChanged: (item) => seat = item))),

              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Container(
                      child: TextField(
                              decoration: InputDecoration(
                                  labelText: "71C2",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.grey, width: 0),
                                      borderRadius: BorderRadius.circular(15))),
                            )
                  )
              ) ,

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 50.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 50.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.orangeAccent),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.all(20))),
                                child: Text("Hủy",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        height: 0)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ManageTicket()));
                                },
                              ))),
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 50.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.orangeAccent),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.all(20))),
                                child: Text("Lưu",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        height: 0)),
                                onPressed: () {},
                              )))
                    ]),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         ElevatedButton(
              //           style: ButtonStyle(
              //               shape:
              //                   MaterialStateProperty.all<RoundedRectangleBorder>(
              //                       RoundedRectangleBorder(
              //                           borderRadius: BorderRadius.circular(30.0))),
              //               backgroundColor: MaterialStateProperty.all<Color>(
              //                   Colors.orangeAccent),
              //               padding: MaterialStateProperty.all<EdgeInsets>(
              //                   EdgeInsets.all(10))),
              //           child: Text("Quay lại",
              //               style: TextStyle(
              //                   color: Colors.white, fontSize: 12, height: 0)),
              //           onPressed: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => ManageTicket()));
              //           },
              //         )
              //
              //       ]),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
          // Padding(
          //   padding:
          //       const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          //   child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         ElevatedButton(
          //           style: ButtonStyle(
          //               shape:
          //                   MaterialStateProperty.all<RoundedRectangleBorder>(
          //                       RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(30.0))),
          //               backgroundColor: MaterialStateProperty.all<Color>(
          //                   Colors.orangeAccent),
          //               padding: MaterialStateProperty.all<EdgeInsets>(
          //                   EdgeInsets.all(10))),
          //           child: Text("Quay lại",
          //               style: TextStyle(
          //                   color: Colors.white, fontSize: 12, height: 0)),
          //           onPressed: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => ManageTicket()));
          //           },
          //         )
          //
          //       ]),
          // )

