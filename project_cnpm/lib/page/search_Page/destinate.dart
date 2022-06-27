import 'package:flutter/material.dart';
import 'dart:async';
class Destinate extends StatefulWidget {

  @override
  State<Destinate> createState() => _DestinateState();
}

class _DestinateState extends State<Destinate> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  String? _country_id ="Hà Nội";
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
        hint: Text("Chọn điểm kết thúc"),
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
