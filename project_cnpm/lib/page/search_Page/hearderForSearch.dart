
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/page/edit_trip_manager.dart';
import 'package:project_cnpm/page/listTripPage.dart';
import 'package:intl/intl.dart';

import '../../DAO/Trips.dart';
import 'constants.dart';


class Header extends StatefulWidget {
  const Header({Key? k, required this.size}) : super(key: k);
  final Size size;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  int _ngayDi =1;
  int _thangDi =1;
  int _namDi =2022;
  int _ngayVe =1;
  int _thangVe =1;
  int _namVe =2022;
  int _set = 1;
  var ds1 = [for (var i = 1; i <= 31; i++) i];
  var dsThang = [for (var i = 1; i <= 12; i++) i];
  var dsNam = [for (var i = 2022; i <= 2030; i++) i];


  int get set => _set;

  static set diemXuatPhat(String value) {
    _diemXuatPhat = value;
  }
  static set diemKetThuc(String value) {
    _diemKetThuc = value;
  }
  static String get diemXuatPhat => _diemXuatPhat;
  static String _diemXuatPhat ="TP Hồ Chí Minh";
  static String _diemKetThuc ="Hà Nội";
  List<String> country = [
    "TP Hồ Chí Minh",
    "Nha Trang",
    "Đà Lạt",
    "Vũng Tàu",
    "Cần Thơ",
    "Huế",
    "Đà Nẵng",
    "Hà Nội",
    "Hà Giang"
  ];
  DateTime date = DateTime(2022, 7, 26);
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      // It will cover 20% of our total height
      height: 500,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 50 + kDefaultPadding,
            ),
            height: 200 ,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              image: DecorationImage(
                image: AssetImage('bus.png'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.23),
                ),
              ],
              // borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(36),
              //   bottomRight: Radius.circular(36),
              // ),
            ),
            child: Row(
              children: const <Widget>[
                Text(
                  'TÌM TUYẾN XE',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 146, 0, 1.0),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  // style: Theme.of(context).textTheme.headline5.copyWith(
                  //     color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                // Image.asset("assets/images/logo.png")
              ],
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 108,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0.8, 0.8, 2),
                    child: Container(
                        width: 320,
                        child: Container(
                          color: Colors.white,
                          width: 300,
                          padding: EdgeInsets.all(0.5),
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            focusColor: Colors.green,
                            value: _diemXuatPhat,
                            isExpanded: true,
                            hint: Text("Chọn điểm khởi hành"),
                            onChanged: (newValue){
                              setState((){
                                _diemXuatPhat = newValue!;
                                // temp = newValue!;
                              });
                            },
                            items: country.map((newValue){
                              return DropdownMenuItem(
                                value: newValue,
                                child: Text(newValue),
                              );
                            }).toList(),
                          ),
                        )
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    height: 1,
                    width: 320,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,0,0,0),
                    child: Container(
                        width: 320,
                        child: Container(
                          color: Colors.white,
                          width: 300,
                          padding: EdgeInsets.all(0.5),
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            focusColor: Colors.green,
                            value: _diemKetThuc,
                            isExpanded: true,
                            hint: Text("Chọn điểm kết thúc"),
                            onChanged: (newValue){
                              setState((){
                                _diemKetThuc = newValue!;

                              });
                            },
                            items: country.map((newValue){
                              return DropdownMenuItem(
                                value: newValue,
                                child: Text(newValue),
                              );
                            }).toList(),
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 90,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 108,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          color: Colors.white,
                          height: 40,
                          width: 250,
                          child: ListTile(
                            title: const Text("Một chiều"),
                            leading: Radio<int>(
                              value: 1,
                              groupValue: _set,
                              onChanged: (newValue){
                                setState((){
                                  _set = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        height: 40,
                        width: 1,
                      ),

                      Expanded(
                        child: Container(
                          color: Colors.white,
                          height: 40,
                          width: 250,

                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40,0,0,0),
                            child: ListTile(
                              title: const Text("Khứ hồi"),
                              leading: Radio<int>(
                                value: 2,
                                groupValue: _set,
                                onChanged: (newValue){
                                  setState((){
                                    _set = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.grey,
                    height: 1,
                  ),
                  Row(
                    children: <Widget>[

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Container(
                            color: Colors.white,
                            height: 60,
                            width: 250,
                            child: Container(
                              height: 100,
                              width: 100,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Positioned(
                                    left: 0,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 0, 5),
                                      child: Text("Ngày đi",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                      onPressed: () async  {
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
                                      child: Container(
                                        color: Colors.transparent,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 20,
                                            height: 30,
                                            child:
                                            Text("${date.day}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 30,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(child: Column(
                                          children: [
                                            Container(
                                              height: 15,
                                              alignment: Alignment.centerLeft,
                                              child:Text("TH${date.month}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                height: 15,
                                                child: Text("${date.year}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ))
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          height: 60,
                          width: 250,
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 40,
                        child: Image.asset('calendar.png'),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          height: 60,
                          width: 250,

                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Container(
                            color: Colors.white,
                            height: 60,
                            width: 250,
                            child: Container(
                              height: 100,
                              width: 100,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Positioned(
                                    left: 0,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 0, 5),
                                      child: Text("Ngày về",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                      onPressed: () async  {
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
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(

                                                alignment: Alignment.center,
                                                width: 20,
                                                height: 30,
                                                child:
                                                Text("${date.day}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.grey
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(child: Column(
                                              children: [
                                                Container(
                                                  height: 15,
                                                  alignment: Alignment.centerLeft,
                                                  child:Text("TH${date.month}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                                                  child: Container(
                                                    alignment: Alignment.centerLeft,
                                                    height: 15,
                                                    child: Text("${date.year}",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 150,
            left: -8,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 110,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child:Container(
                child: Container(
                    height: 70,
                    width: 70,
                    child: Image.asset('vecto.png')),
              ),
            ),
          ),
          Positioned(
            top: 150,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child:Container(

                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        String temp = _diemXuatPhat;
                        _diemXuatPhat = _diemKetThuc;
                        _diemKetThuc = temp;
                      });

                    },
                    child: Container(
                        height: 50,
                        width: 50,
                        child: Image.asset('re.png')),

                  )
              ),

            ),
          ),
          Positioned(
            bottom: 15,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              // decoration: BoxDecoration(
              //   color: Colors.blue,
              //   borderRadius: BorderRadius.circular(20),
              // ),
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 40,
              child:Container(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.amber,
                  onPressed: (){
                    var formatter = new DateFormat('dd/MM/yyyy');
                    String formattedDate = formatter.format(date);
                    print(formattedDate);
                    Navigator.push(
                        this.context,
                        MaterialPageRoute(
                            builder: (context) => ListTrip(
                                diemBatDau: _diemXuatPhat,
                                diemKetThuc: _diemKetThuc, date: formattedDate )
                                // +'/'+date.toString().substring(6,2)+'/'+date.toString().substring(0,4))
                        ));
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Image.asset('find.png'),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Text(
                          "Tìm kiếm",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );

  }
  bool isSelect = false;
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
    trailing: ElevatedButton(
        onPressed: () => Navigator.push(
            this.context,
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
