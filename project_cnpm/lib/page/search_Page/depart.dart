import 'package:flutter/material.dart';
import 'dart:async';
class Depart extends StatefulWidget {

  @override
  State<Depart> createState() => _DepartState();
}

class _DepartState extends State<Depart> {
  @override
  void initState() {
    super.initState();
  }
  String? _country_id ="TP Hồ Chí Minh";
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 300,
      padding: EdgeInsets.all(0.5),
      child: DropdownButton<String>(
        underline: SizedBox(),
        focusColor: Colors.green,
        value: _country_id,
        isExpanded: true,
        hint: Text("Chọn điểm khởi hành"),
        onChanged: (newValue){
          setState((){
            _country_id = newValue;
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
    ;

  }
}
