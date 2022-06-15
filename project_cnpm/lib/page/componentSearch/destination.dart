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
  String country_id="";
  List<String> country = [
    "America",
    "Brazil",
    "Canada",
    "India",
    "Mongalia",
    "USA",
    "China",
    "Russia",
    "Germany"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 300,
      padding: EdgeInsets.all(0.5),
      child: DropdownButton(
        underline: SizedBox(),
        focusColor: Colors.green,
        value: country_id,
        isExpanded: true,
        hint: Text("Chọn điểm kết thúc"),
        onChanged: (newValue){
          setState((){
            // country_id = newValue;
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
